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

  in {
    packages = forAllSystems (system:
      {
        vimix-nord-cursors =
        let
          pkgs = import nixpkgs {inherit system;};
        in pkgs.stdenv.mkDerivation {
          pname = "vimix-nord-cursors";
          version = "1.0";

          src = pkgs.fetchFromGitHub {
            owner = "tristanRW";
            repo = "Vimix-nord-cursors";
            rev = "v1.0";
            sha256 = "sha256-vgerrPCoECm+cChfQN0VcqEeGT3wTg5E2l5a5Sr3cfQ=";
          };

          installPhase = ''
            install -dm 0755 $out/share/icons

            cp -pr dist/ $out/share/icons/vimix-nord-cursors
            mv $out/share/icons/vimix-nord-cursors/index.theme $out/share/icons/vimix-nord-cursors/cursor.theme
            cp -pr dist-white/ $out/share/icons/vimix-nord-white-cursors
            mv $out/share/icons/vimix-nord-white-cursors/index.theme $out/share/icons/vimix-nord-white-cursors/cursor.theme
          '';

          meta = with pkgs.lib; {
            description = "Cursor theme using the Nord color palette based on Vimix";
            homepage = "https://github.com/tristanRW/Vimix-nord-cursors";
            license = licenses.gpl3;
            platforms = platforms.all;
            maintainers = with maintainers; [
            tristanRW
            ];
          };
        };
    });

    legacyPackages = forAllSystems (system:
      {
        vimix-nord-cursors =
        let
          pkgs = import nixpkgs {inherit system;};
        in pkgs.stdenv.mkDerivation {
          pname = "vimix-nord-cursors";
          version = "1.0";

          src = pkgs.fetchFromGitHub {
            owner = "tristanRW";
            repo = "Vimix-nord-cursors";
            rev = "v1.0";
            sha256 = "sha256-vgerrPCoECm+cChfQN0VcqEeGT3wTg5E2l5a5Sr3cfQ=";
          };

          installPhase = ''
            install -dm 0755 $out/share/icons

            cp -pr dist/ $out/share/icons/vimix-nord-cursors
            mv $out/share/icons/vimix-nord-cursors/index.theme $out/share/icons/vimix-nord-cursors/cursor.theme
            cp -pr dist-white/ $out/share/icons/vimix-nord-white-cursors
            mv $out/share/icons/vimix-nord-white-cursors/index.theme $out/share/icons/vimix-nord-white-cursors/cursor.theme
          '';

          meta = with pkgs.lib; {
            description = "Cursor theme using the Nord color palette based on Vimix";
            homepage = "https://github.com/tristanRW/Vimix-nord-cursors";
            license = licenses.gpl3;
            platforms = platforms.all;
            maintainers = with maintainers; [
            tristanRW
            ];
          };
        };
    });

  };
}