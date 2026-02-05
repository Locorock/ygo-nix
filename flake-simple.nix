{
  description = "YGO Omega - Yu-Gi-Oh! Trading Card Game Simulator";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachSystem ["x86_64-linux"] (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        ygo-omega = pkgs.stdenv.mkDerivation {
          pname = "ygo-omega";
          version = "latest";

          src = ./.;

          nativeBuildInputs = with pkgs; [ makeWrapper unzip ];

          unpackPhase = ''
            runHook preUnpack
            unzip -q ${./linux-x64.zip}
            unzip -q ${./Omega_Launcher-Linux.zip}
            runHook postUnpack
          '';

          installPhase = ''
            runHook preInstall

            mkdir -p $out/share/ygo-omega
            cp -r . $out/share/ygo-omega/
            chmod +x $out/share/ygo-omega/YGO\ Omega.x86_64
            chmod +x $out/share/ygo-omega/OmegaUpdater

            mkdir -p $out/bin
            makeWrapper ${pkgs.bash}/bin/bash $out/bin/ygo-omega \
              --add-flags ${./ygo-omega-wrapper.sh} \
              --prefix LD_LIBRARY_PATH : "${pkgs.lib.makeLibraryPath [
                pkgs.libGL
                pkgs.vulkan-loader
                pkgs.xorg.libX11
                pkgs.xorg.libXcursor
                pkgs.xorg.libXrandr
                pkgs.xorg.libXi
                pkgs.libpulseaudio
                pkgs.stdenv.cc.cc.lib
                pkgs.krb5
                pkgs.sqlite
              ]}" \
              --set OUT "$out"

            runHook postInstall
          '';

          meta = with pkgs.lib; {
            description = "YGO Omega - Yu-Gi-Oh! Trading Card Game Simulator";
            homepage = "https://github.com/duelists-unite/omega-releases";
            license = licenses.unfree;
            platforms = [ "x86_64-linux" ];
            mainProgram = "ygo-omega";
          };
        };

      in {
        packages.default = ygo-omega;
        apps.default = {
          type = "app";
          program = "${ygo-omega}/bin/ygo-omega";
        };
      }
    );
}
