{
  description = "YGO Omega - Yu-Gi-Oh! Trading Card Game Simulator";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        # Game files - fetched from GitHub releases
        # NOTE: Update these URLs if the release structure changes
        # To find latest URLs, visit: https://github.com/duelists-unite/omega-releases/releases
        gameFiles = pkgs.fetchurl {
          url = "https://github.com/duelists-unite/omega-releases/releases/download/Latest/linux-x64.zip";
          hash = "sha256-YzS2lNZv2F0+KYe/R7DpTpvmJQy6TICjqPokygb9ifg=";
        };

        launcherFiles = pkgs.fetchurl {
          url = "https://github.com/duelists-unite/omega-releases/releases/download/Latest/Omega_Launcher-Linux.zip";
          hash = "sha256-e7RHLRp/LGae4Z912oBlsTpPQrMCjXlsd18zQIxZVfo=";
        };

        ygo-omega = pkgs.stdenv.mkDerivation {
          pname = "ygo-omega";
          version = "latest";

          # Use empty src since we're fetching files separately
          src = pkgs.emptyDirectory;

          nativeBuildInputs = with pkgs; [
            autoPatchelfHook
            makeWrapper
            unzip
          ];

          # Load-time libraries (DT_NEEDED) - needed by autoPatchelfHook
          buildInputs = with pkgs; [
            alsa-lib
            cairo
            dbus
            glib
            libGL
            pango
            stdenv.cc.cc.lib
            vulkan-loader
            wayland
            libX11
            zlib
          ];

          # Runtime libraries (dlopen) - for makeWrapper
          runtimeLibs = with pkgs; [
            alsa-lib
            cairo
            dbus
            glib
            libGL
            libxkbcommon
            pango
            stdenv.cc.cc.lib
            libX11
            libXcursor
            libXext
            libXi
            libXinerama
            libXrandr
            libXScrnSaver
            libXxf86vm
            udev
            vulkan-loader
            wayland
            zlib
            krb5
            sqlite
          ];

          unpackPhase = ''
            runHook preUnpack
            unzip -q ${gameFiles}
            unzip -q ${launcherFiles}
            runHook postUnpack
          '';

          installPhase = ''
                        runHook preInstall

                        mkdir -p $out/libexec/ygo-omega
                        cp -r . $out/libexec/ygo-omega/
                        chmod +x $out/libexec/ygo-omega/YGO\ Omega.x86_64
                        chmod +x $out/libexec/ygo-omega/OmegaUpdater

                        # Create wrapper script
                        mkdir -p $out/bin
                        cat > $out/bin/.ygo-omega-unwrapped <<'WRAPPER_EOF'
            #!/usr/bin/env bash
            set -e
            DATA_DIR="''${XDG_DATA_HOME:-$HOME/.local/share}/ygo-omega"
            if [ ! -d "$DATA_DIR" ]; then
              echo "First run: Initializing YGO Omega data directory at $DATA_DIR"
              mkdir -p "$DATA_DIR"
              cp -r LIBEXEC_PATH/* "$DATA_DIR/"
              chmod -R u+w "$DATA_DIR"
              chmod +x "$DATA_DIR/YGO Omega.x86_64"
              chmod +x "$DATA_DIR/OmegaUpdater"
              echo "YGO Omega initialized successfully!"
            fi
            cd "$DATA_DIR"
            exec "./YGO Omega.x86_64" "$@"
            WRAPPER_EOF
                        sed -i "s|LIBEXEC_PATH|$out/libexec/ygo-omega|g" $out/bin/.ygo-omega-unwrapped
                        chmod +x $out/bin/.ygo-omega-unwrapped

                        makeWrapper $out/bin/.ygo-omega-unwrapped $out/bin/ygo-omega \
                          --prefix LD_LIBRARY_PATH : "${pkgs.lib.makeLibraryPath ygo-omega.runtimeLibs}" \
                          --set SDL_VIDEODRIVER x11

                        # Create desktop entry
                        mkdir -p $out/share/applications
                        cat > $out/share/applications/ygo-omega.desktop <<DESKTOP_EOF
            [Desktop Entry]
            Type=Application
            Name=YGO Omega
            Comment=Yu-Gi-Oh! Trading Card Game Simulator
            Exec=$out/bin/ygo-omega
            Icon=ygo-omega
            Categories=Game;CardGame;
            Terminal=false
            StartupNotify=true
            Keywords=yugioh;trading card;tcg;omega;
            DESKTOP_EOF

                        # Extract and install icon (from game data)
                        mkdir -p $out/share/icons/hicolor/128x128/apps
                        if [ -f "YGO Omega_Data/Resources/UnityPlayer.png" ]; then
                          cp "YGO Omega_Data/Resources/UnityPlayer.png" \
                             $out/share/icons/hicolor/128x128/apps/ygo-omega.png
                        fi

                        runHook postInstall
          '';

          # Don't auto-patch the game executable - we'll do it manually
          dontAutoPatchelf = true;

          postFixup = ''
            # Run autoPatchelfHook on everything except the main executable
            autoPatchelf -- $out/libexec/ygo-omega/UnityPlayer.so
            autoPatchelf -- $out/libexec/ygo-omega/GameAssembly.so

            # Patch UnityPlayer.so to add runtime libraries
            patchelf \
              --add-needed libasound.so.2 \
              --add-needed libdbus-1.so.3 \
              --add-needed libGL.so.1 \
              --add-needed libvulkan.so.1 \
              --add-needed libX11.so.6 \
              $out/libexec/ygo-omega/UnityPlayer.so

            # Manually patch the main executable with $ORIGIN first in RPATH
            # This allows it to find UnityPlayer.so in current directory after being copied
            patchelf \
              --set-rpath '$ORIGIN:${pkgs.lib.makeLibraryPath ygo-omega.runtimeLibs}' \
              "$out/libexec/ygo-omega/YGO Omega.x86_64"
          '';

          meta = with pkgs.lib; {
            description = "YGO Omega - Yu-Gi-Oh! Trading Card Game Simulator";
            homepage = "https://github.com/duelists-unite/omega-releases";
            license = licenses.unfree;
            platforms = [ "x86_64-linux" ];
            mainProgram = "ygo-omega";
          };
        };

      in
      {
        packages.default = ygo-omega;
        apps.default = {
          type = "app";
          program = "${ygo-omega}/bin/ygo-omega";
        };
      }
    );
}
