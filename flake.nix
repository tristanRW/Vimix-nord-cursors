{
  description = "Vimix cursor themed with nord color-scheme.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs = {self, nixpkgs}:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {

    vimix-nord = pkgs.callPackage ./ {  }; #call default.nix as package
  };
}
