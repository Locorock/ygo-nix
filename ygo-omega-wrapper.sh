#!/usr/bin/env bash
set -e

# XDG-compliant data directory
DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/ygo-omega"

# Initialize data directory on first run
if [ ! -d "$DATA_DIR" ]; then
    echo "First run: Initializing YGO Omega data directory at $DATA_DIR"
    mkdir -p "$DATA_DIR"

    # Copy all game files to user directory
    # (Game needs writable directory for updates and user data)
    cp -r @out@/share/ygo-omega/* "$DATA_DIR/"

    # Make all files writable (they're read-only from /nix/store)
    chmod -R u+w "$DATA_DIR"

    # Ensure executables are executable
    chmod +x "$DATA_DIR/YGO Omega.x86_64" 2>/dev/null || true
    chmod +x "$DATA_DIR/OmegaUpdater" 2>/dev/null || true

    echo "YGO Omega initialized successfully!"
fi

# Check for Discord (for online play)
if [ ! -S "${XDG_RUNTIME_DIR}/discord-ipc-0" ] && [ ! -S "$HOME/.config/discord/discord-ipc-0" ]; then
    echo "Warning: Discord not detected. Online play requires Discord to be running."
    echo "If Discord is installed but not running, start it before launching YGO Omega."
    echo "For online features, Discord must be a native installation (not Snap/Flatpak)."
fi

# Force XWayland for Wayland sessions (Unity games need X11)
export GDK_BACKEND=x11
export QT_QPA_PLATFORM=xcb
export SDL_VIDEODRIVER=x11

# Launch game from data directory
cd "$DATA_DIR"
exec "./YGO Omega.x86_64" "$@"
