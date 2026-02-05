# YGO Omega Nix Package - Now Machine-Independent!

## What Changed

The package has been decoupled from your local system and can now be built on **any machine**.

### Before (System-Dependent)
```nix
unpackPhase = ''
  unzip -q ${./linux-x64.zip}          # ❌ Requires local file
  unzip -q ${./Omega_Launcher-Linux.zip}  # ❌ Requires local file
''
```

### After (Machine-Independent)
```nix
gameFiles = pkgs.fetchurl {
  url = "https://github.com/duelists-unite/omega-releases/releases/download/Latest/linux-x64.zip";
  hash = "sha256-O89OJFcAJ8XVvWMjIxGbPWrdgtZZEeCnnU6/zc+w8fc=";  # ✅ Verified hash
};

launcherFiles = pkgs.fetchurl {
  url = "https://github.com/duelists-unite/omega-releases/releases/download/Latest/Omega_Launcher-Linux.zip";
  hash = "sha256-e7RHLRp/LGae4Z912oBlsTpPQrMCjXlsd18zQIxZVfo=";  # ✅ Verified hash
};
```

## Benefits

1. **✅ Reproducible**: SHA256 hashes ensure everyone gets the same files
2. **✅ Portable**: Works on any NixOS machine with internet access
3. **✅ No local files needed**: Zip files fetched from GitHub automatically
4. **✅ Cacheable**: Nix will cache downloaded files across builds
5. **✅ Git-friendly**: Zip files excluded from repository

## Usage

Anyone can now build/install YGO Omega with:

```bash
# Direct run
nix run github:digiboid/ygo-nix

# Or add to their NixOS config
inputs.ygo-nix.url = "github:digiboid/ygo-nix";
```

No local setup required!

## File Sources

- **Game files**: [duelists-unite/omega-releases](https://github.com/duelists-unite/omega-releases)
- **Release**: Latest (January 10, 2025)
- **Linux files**:
  - `linux-x64.zip` (157 MB)
  - `Omega_Launcher-Linux.zip` (6.11 MB)

## Updating Game Version

When YGO Omega releases an update:

1. Check new release at: https://github.com/duelists-unite/omega-releases/releases
2. Download new zip files
3. Calculate new hashes:
   ```bash
   nix hash file --type sha256 --sri linux-x64.zip
   nix hash file --type sha256 --sri Omega_Launcher-Linux.zip
   ```
4. Update `hash` values in `flake.nix`
5. Update `version` if desired
6. Test build: `nix build .#default`
7. Commit and push

## Local Testing (Development)

If you want to test with local files during development, you can temporarily modify the flake:

```nix
gameFiles = ./linux-x64.zip;  # Local file
launcherFiles = ./Omega_Launcher-Linux.zip;  # Local file
```

Then revert to fetchurl before committing.

## Verification

The SHA256 hashes match the official GitHub release:
- ✅ `linux-x64.zip`: `3bcf4e24570027c5d5bd632323119b3d6add82d65911e0a79d4ebfcdcfb0f1f7`
- ✅ Converted to SRI format for Nix

This ensures users get authentic, unmodified game files.
