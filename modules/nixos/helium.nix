{ pkgs, ... }: let
  helium = pkgs.callPackage ./helium-package.nix { };
in {
  environment.systemPackages = [
    helium
  ];

}

