# YGO Omega Nix Package

A Nix flake for [YGO Omega](https://github.com/duelists-unite/omega-releases), the Yu-Gi-Oh! Trading Card Game Simulator.

## Features

- Declarative NixOS integration
- FHS environment for Unity game compatibility
- XDG-compliant data directory (`~/.local/share/ygo-omega`)
- Built-in updater support
- Discord integration (when Discord is installed)
- Comprehensive dependency management (Vulkan, codecs, libraries)

## Requirements

- NixOS with flakes enabled
- x86_64-Linux architecture
- Vulkan-capable GPU (AMD, Intel, or NVIDIA)
- (Optional) Native Discord installation for online play

## Installation

### Method 1: Add to NixOS Configuration

Add to your `flake.nix`:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    ygo-nix.url = "github:digiboid/ygo-nix";
    # Or for development:
    # ygo-nix.url = "path:/home/boid/projects/ygo-nix";
  };

  outputs = { nixpkgs, ygo-nix, ... }: {
    nixosConfigurations.yourhost = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({ pkgs, ... }: {
          environment.systemPackages = [
            # Option 1: Use pkgs.stdenv.hostPlatform.system
            ygo-nix.packages.${pkgs.stdenv.hostPlatform.system}.default

            # Option 2: Direct reference (simpler, x86_64-linux only)
            # ygo-nix.packages.x86_64-linux.default
          ];

          # IMPORTANT: Enable Vulkan support
          hardware.graphics = {
            enable = true;
            enable32Bit = true;  # Required for some Unity games
          };

          # Optional: Install Discord for online play
          # environment.systemPackages = [ pkgs.discord ];
        })
      ];
    };
  };
}
```

Then rebuild your system:

```bash
sudo nixos-rebuild switch --flake .#yourhost
```

### Method 2: Run Directly (No Installation)

```bash
nix run github:digiboid/ygo-nix
```

### Method 3: Install to User Profile

```bash
nix profile install github:digiboid/ygo-nix
```

## Usage

### First Run

On first launch, the wrapper will:
1. Create data directory at `~/.local/share/ygo-omega`
2. Copy game files from `/nix/store` to your home directory
3. Set executable permissions
4. Launch the game

This initialization takes a moment (copying ~160MB).

### Launching the Game

```bash
ygo-omega
```

Or with arguments:

```bash
ygo-omega --reset  # Reset game settings (fixes black screen issues)
```

### Updating the Game

The OmegaUpdater is available in your data directory:

```bash
cd ~/.local/share/ygo-omega
./OmegaUpdater
```

Updates are downloaded to your local data directory, not the Nix store.

### Discord Integration

For online play, you need **native Discord** installed:

```nix
environment.systemPackages = [ pkgs.discord ];
```

**Important**: Snap and Flatpak versions of Discord do **not** work. The game requires access to Discord's IPC socket.

## Troubleshooting

### Black Screen on Launch

Animated backgrounds can cause black screens on some systems. Reset with:

```bash
ygo-omega --reset
```

### 9999/9999 Decks Bug

This package includes SQLite3, which prevents this bug. If you still encounter it, ensure you're using the FHS-wrapped version (default).

### Vulkan Errors

Verify Vulkan is working:

```bash
vulkaninfo | head -20
```

For NVIDIA GPUs, ensure proprietary drivers are enabled:

```nix
services.xserver.videoDrivers = [ "nvidia" ];
hardware.graphics.enable = true;
```

### Discord Not Detected

The warning "Discord not detected" appears if:
- Discord is not installed
- Discord is installed via Snap/Flatpak (unsupported)
- Discord is not running

**Solution**: Install native Discord from nixpkgs:

```nix
environment.systemPackages = [ pkgs.discord ];
```

### Game Won't Launch

Check the data directory permissions:

```bash
ls -la ~/.local/share/ygo-omega/
chmod +x ~/.local/share/ygo-omega/YGO\ Omega.x86_64
```

## Technical Details

### Architecture

This package uses `buildFHSEnv` to create a Filesystem Hierarchy Standard environment, which Unity games expect. The wrapper:

1. Creates isolated FHS environment with all dependencies
2. Copies game files to user's home directory (writable location)
3. Launches game from the user's data directory

### Why Copy to Home Directory?

Unity games and the OmegaUpdater expect to write to their installation directory. Since `/nix/store` is read-only, we copy the entire game to `~/.local/share/ygo-omega` on first run.

### Dependencies Included

**Graphics & Vulkan**:
- vulkan-loader, vulkan-tools
- libGL, libGLU, mesa

**Required Libraries** (per official installation guide):
- krb5 (Kerberos 5)
- sqlite (prevents 9999/9999 Decks bug)

**Unity Runtime**:
- X11 libraries (window management)
- PulseAudio, ALSA (audio)
- Standard C++ runtime

**Video Codecs** (animated backgrounds):
- FFmpeg
- GStreamer with VP8 codec support

## Development

### Building Locally

```bash
nix build .#ygo-omega-unwrapped  # Base package without FHS wrapper
nix build .#default              # Full FHS-wrapped package (recommended)
```

**Note**: The flake automatically configures `allowUnfree`, so no additional flags are needed.

### Package Structure

- `flake.nix` - Main flake definition
- `ygo-omega-wrapper.sh` - Launcher script with first-run initialization
- `linux-x64.zip` - Main game files (158 MB)
- `Omega_Launcher-Linux.zip` - OmegaUpdater (6.2 MB)

## Files Installed

**System** (`/nix/store/...`):
- Game files (read-only)
- FHS environment
- Dependencies

**User** (`~/.local/share/ygo-omega/`):
- Game executable: `YGO Omega.x86_64`
- Updater: `OmegaUpdater`
- Game data: `YGO Omega_Data/`
- User settings and deck files

## Uninstallation

Remove from system:

```bash
# Remove from system packages in your configuration.nix or flake.nix
sudo nixos-rebuild switch
```

Remove user data (optional):

```bash
rm -rf ~/.local/share/ygo-omega
```

## Known Limitations

1. **x86_64-Linux only** - No ARM or macOS support (Unity Linux builds are x86_64)
2. **Discord must be native** - Snap/Flatpak Discord won't work for online features
3. **Vulkan required** - Older GPUs without Vulkan support cannot run the game
4. **Large first-run copy** - ~160MB copied to home directory on first launch

## Contributing

Issues and pull requests welcome at: [https://github.com/digiboid/ygo-nix](https://github.com/digiboid/ygo-nix)

## License

- **YGO Omega**: Unfree (proprietary game client)
- **This packaging**: MIT License (or your preferred license)

## References

- [YGO Omega Official Repository](https://github.com/duelists-unite/omega-releases)
- [Installation Guide](./Installation%20and%20Troubleshooting%20Guide%20-%20YGO%20Omega%20%20General.md)
- [NixOS Wiki: Packaging/Binaries](https://nixos.wiki/wiki/Packaging/Binaries)
