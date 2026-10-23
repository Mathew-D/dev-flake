{
  description = "Development environment for Rust GUI applications";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, rust-overlay, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
        rustToolchain = pkgs.rust-bin.stable."1.99.1".default.override {
          extensions = [ "rust-src" "rust-analyzer" ];
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            rustToolchain
            dbus
            libGL
            vulkan-loader
            wayland
            libx11
            libxcb
            libxcursor
            libxi
            libxrandr
            libxkbcommon
            libva
            pkg-config
            xorg.libXdmcp
            xorg.libXext
          ];

          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
            pkgs.libGL
            pkgs.vulkan-loader
            pkgs.wayland
            pkgs.libx11
            pkgs.libxcb
            pkgs.libxcursor
            pkgs.libxi
            pkgs.libxrandr
            pkgs.libxkbcommon
            pkgs.libva
          ];

          shellHook = ''
            echo "Rust GUI development environment loaded"
            echo "Rust version: $(rustc --version)"
            echo "Navigate to your project and run: cargo run"
          '';
        };
      }
    );
}
