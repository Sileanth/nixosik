{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
let
  cfg = config.mc.ddc;
in
{

  imports = [
  ];

  options = {
    mc.ddc = {
      enable = lib.mkEnableOption "enable ddc";
    };

  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      ddcutil
    ];
    hardware.i2c.enable = true;
    # allow i2c without sudo
    users.users.sileanth.extraGroups = [
      "i2c"
    ];
    home-manager.users.sileanth = {
    };
  };
}
