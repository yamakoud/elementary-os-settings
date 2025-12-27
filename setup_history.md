# Setup History (2025-12-27)

## 1. Nix Installation
Installed via multi-user install script.
```bash
curl -L https://nixos.org/nix/install | sh -s -- --daemon --yes
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
```

## 2. Kinto.sh Installation & Fixes
Installed Kinto to enable Mac-like keybindings.

### Installation
Used the official installer (failed initially due to missing dependencies).
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/rbreaves/kinto/HEAD/install/linux.sh)"
```

### Fixes for Elementary OS (Ubuntu based)
1. **Dependencies**: Installed `python3-gi`, `python3-gi-cairo`, `gir1.2-gtk-3.0`, `gir1.2-appindicator3-0.1`.
2. **xkeysnail Patch**: Fixed compatibility issue with Python 3.12+ (AttributeError: 'InputDevice' object has no attribute 'fn').
   - Replaced `.fn` with `.path` in `/usr/local/lib/python3.12/dist-packages/xkeysnail/input.py`.

