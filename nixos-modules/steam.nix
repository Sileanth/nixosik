{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.mc.steam;
in
{

  imports = [
  ];

  options = {
    mc.steam = {
      enable = lib.mkEnableOption "enable steam";
    };

  };
  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;

    };

  };
}
