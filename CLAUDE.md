# Instructions for Claude for project YGO Omega
Your task is to package YGO Omega to be available for NixOS

## Flake.nix
To package the nix project you will create a flake.nix in a project folder (current pwd)
With that the nixos user will be adding the project inputs such as:

in flake.nix
```nix
  inputs = {
    ygo-nix = {
      # url = "github:digiboid/ygo-nix";
      url = "path:/home/boid/projects/ygo-nix"; # for development purposes
    };
  }
```

```nix
    outputs =
    {
      ygo-nix,
      ...
    }@inputs:
```
in modules
```nix
      nixosConfigurations = {
        host = lib.nixosSystem {
          modules = [
          inputs.ygo-nix.packages.${pkgs.stdenv.hostPlatform.system}.default
```

## Installation instructions
Check file Installation and Troubleshooting Guide - YGO Omega  General.md

## Installation files
Linux-x64.zip
and Omega_Launcher-Linux.zip
