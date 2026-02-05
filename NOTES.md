# Important Notes for YGO Omega Nix Package

## For Development/Testing

The flake automatically configures `allowUnfree` in its nixpkgs import, so no additional configuration is needed:

```bash
nix build .#default  # Just works!
```

## For NixOS System Configuration

No special unfree configuration needed - the ygo-nix flake handles it automatically.

## First-Time Users

On first launch, the game will:
1. Create `~/.local/share/ygo-omega` directory
2. Copy ~160MB of game files (takes 10-30 seconds)
3. Launch the game

This is **expected behavior** and only happens once.

## Data Directory Management

The game data lives in `~/.local/share/ygo-omega`. This includes:
- Game executable and libraries
- User settings
- Deck files
- Downloaded updates

To completely remove YGO Omega:
```bash
rm -rf ~/.local/share/ygo-omega
```

## Updating the Package

To update the Nix package itself:

```bash
nix flake update  # Updates flake.lock
sudo nixos-rebuild switch
```

To update the game content (in-game updates):

```bash
cd ~/.local/share/ygo-omega
./OmegaUpdater
```

## Zip Files

The `linux-x64.zip` and `Omega_Launcher-Linux.zip` files are:
- Included in `.gitignore` (too large for git)
- Should be fetched from [YGO Omega releases](https://github.com/duelists-unite/omega-releases)
- Currently sourced locally for development

For production, consider:
1. Using `fetchurl` to download from GitHub releases
2. Hosting on a binary cache
3. Using Git LFS for the zip files

## Hardware Requirements

Minimum:
- Vulkan-capable GPU
- 2GB RAM
- 500MB disk space

Recommended:
- Modern GPU (NVIDIA, AMD, or Intel)
- 4GB RAM
- 1GB disk space (for game + updates)

## Discord Integration

For online play:
1. Install Discord: `environment.systemPackages = [ pkgs.discord ];`
2. Launch Discord before launching YGO Omega
3. Discord must be running for online features to work

The game checks for Discord's IPC socket at:
- `$XDG_RUNTIME_DIR/discord-ipc-0`
- `~/.config/discord/discord-ipc-0`

## Troubleshooting Common Issues

### "No such file or directory: YGO Omega"
The executable is `YGO Omega.x86_64` (fixed in this package).

### Black screen on launch
Run with `--reset` flag: `ygo-omega --reset`

### Vulkan errors
Check: `vulkaninfo | head -20`
Enable: `hardware.graphics.enable = true;`

### Files are read-only
This is normal for files copied from `/nix/store`. The game can still:
- Write to its data directory
- Create deck files
- Save settings
- Download updates

## Security Considerations

This package:
- Runs the game in an FHS environment (isolated)
- Does not require elevated privileges
- Stores all data in user's home directory
- Does not modify system files

However, note:
- YGO Omega is proprietary/unfree software
- Network connectivity is required for updates and online play
- Discord integration requires IPC socket access

## Performance Tips

1. **Enable 32-bit support** (some Unity games need it):
   ```nix
   hardware.graphics.enable32Bit = true;
   ```

2. **Use latest drivers**:
   ```nix
   hardware.graphics.package = pkgs.mesa.drivers;
   ```

3. **For NVIDIA users**:
   ```nix
   services.xserver.videoDrivers = [ "nvidia" ];
   ```

## File Sizes

- `linux-x64.zip`: 158 MB (main game)
- `Omega_Launcher-Linux.zip`: 6.2 MB (updater)
- Total installed: ~165 MB in Nix store + ~165 MB in home directory
- After updates: May grow to 200-300 MB in home directory

## Version Information

- Package version: `latest` (tracks current release)
- Game version: Determined by zip file contents
- To pin a specific version: Modify `version` in `flake.nix`

## Contributing

When updating this package:

1. Test builds with `nix build .#default --impure`
2. Verify game launches: `./result/bin/ygo-omega`
3. Check for new dependencies in installation guide
4. Update README.md if behavior changes
5. Run `nix flake check --impure` before committing

## License

- **This packaging code**: MIT or your chosen license
- **YGO Omega game**: Proprietary/unfree
- **Dependencies**: Various (mostly free/open source)

Users must accept the unfree license to install.
