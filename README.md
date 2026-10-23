# Rust GUI Development Environment

A Nix flake providing a development environment for Rust GUI applications with all necessary native dependencies.

## Usage

### Development shell (local)
```bash
nix develop
```

Then navigate to any Rust project (like notecraft) and run:
```bash
cargo run
```

### Development shell (from GitHub)
```bash
nix develop github:mathew-d/dev-flake
```
or 
```bash
nix develop github:mathew-d/dev-flake --no-write-lock-file
```

Then navigate to any Rust project and run:
```bash
cargo run
```

### Direct command
```bash
nix develop --command cargo run
```

## Included Dependencies

- Rust 1.99.1 with rust-analyzer
- GUI libraries: dbus, libGL, vulkan-loader, wayland, libx11, libxcb, libxcursor, libxi, libxrandr, libxkbcommon, libva
- Build tools: pkg-config

## Example with NoteCraft

```bash
nix develop
cd ~/notecraft
cargo run --release -p notecraft
```
