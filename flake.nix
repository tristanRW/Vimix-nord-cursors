{
  description = "Vimix cursor themed with nord color-scheme.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs = {nixpkgs}:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {

    vimix-cursors-nord = vimix-cursors-nord = pkgs.callPackage ./vimix-nord {  };

  };
}
