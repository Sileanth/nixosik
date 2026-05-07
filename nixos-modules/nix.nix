{
  lib,
  config,
  ...
}:
let
  cfg = config.mc.nix;
in
{

  imports = [
  ];

  options = {
    mc.nix = {
      enable = lib.mkEnableOption "enable nix";
    };

  };
  config = lib.mkIf cfg.enable {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
      "pipe-operators"
    ];

    nixpkgs.config.allowUnfree = true;
    nix.settings.auto-optimise-store = true;
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 10d";
    };
  };
}
