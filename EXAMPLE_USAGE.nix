# Example NixOS configuration using YGO Omega flake
#
# Add this to your /etc/nixos/flake.nix or personal flake configuration

{
  description = "Example NixOS configuration with YGO Omega";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    ygo-nix.url = "github:digiboid/ygo-nix";
  };

  outputs = { self, nixpkgs, ygo-nix, ... }: {
    nixosConfigurations.myhost = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Your existing configuration
        ./configuration.nix

        # YGO Omega module
        ({ pkgs, ... }: {
          # Install YGO Omega
          environment.systemPackages = [
            ygo-nix.packages.${pkgs.stdenv.hostPlatform.system}.default

            # Optional: Install Discord for online play
            pkgs.discord
          ];

          # REQUIRED: Enable hardware graphics acceleration
          hardware.graphics = {
            enable = true;
            enable32Bit = true;
          };

          # For NVIDIA users (uncomment if you have NVIDIA GPU):
          # services.xserver.videoDrivers = [ "nvidia" ];
          # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

          # Note: The ygo-nix flake handles unfree packages automatically
        })
      ];
    };
  };
}
