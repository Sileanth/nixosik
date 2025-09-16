{
  lib,
  config,
  disko,
  ...
}:
let
  cfg = config.mc.hyprland;
in
{

  imports = [
  ];

  options = {
    mc.hyprland = {
      enable = lib.mkEnableOption "enable hyprland";
    };

  };
  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      withUWSM = true;
      enable = true;
      xwayland.enable = true;

    };
    programs.uwsm.enable = true;
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    security.pam.services.hyprlock = { };
  };
}
