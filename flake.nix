{
  description = "local packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs = {self, nixpkgs}:
  let

    # System types to support.
    supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];

    # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

    # Nixpkgs instantiated for supported system types.
    #nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; overlays = [ self.overlay ]; });

  in {

    vimix-nord-cursors = with nixpkgs; nixpkgs.stdenv.mkDerivation rec {
      pname = "vimix-nord-cursors";
      version = "1.0";

      src = nixpkgs.fetchFromGitHub {
        owner = "tristanRW";
        repo = "Vimix-nord-cursors";
        rev = "v${version}";
        sha256 = "sha256-vgerrPCoECm+cChfQN0VcqEeGT3wTg5E2l5a5Sr3cfQ=";
      };

      installPhase = ''
        install -dm 0755 $out/share/icons

        cp -pr dist/ $out/share/icons/vimix-nord-cursors
        mv $out/share/icons/vimix-nord-cursors/index.theme $out/share/icons/vimix-nord-cursors/cursor.theme
        cp -pr dist-white/ $out/share/icons/vimix-nord-white-cursors
        mv $out/share/icons/vimix-nord-white-cursors/index.theme $out/share/icons/vimix-nord-white-cursors/cursor.theme
      '';

      meta = with nixpkgs.lib; {
        description = "Cursor theme using the Nord color palette based on Vimix";
        homepage = "https://github.com/tristanRW/Vimix-nord-cursors";
        license = licenses.gpl3;
        platforms = platforms.all;
        maintainers = with maintainers; [
        tristanRW
        ];
      };
    };

    # Provide some binary packages for selected system types.
    packages = forAllSystems (system:
      {
        vimix-nord-cursors = self.vimix-nord-cursors;
      });
  };
}