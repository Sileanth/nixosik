{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.mc.niri;
in
{

  imports = [
  ];

  options = {
    mc.niri = {
      enable = lib.mkEnableOption "enable niri";
    };

  };
  config = lib.mkIf cfg.enable {
    programs.niri = {
      enable = true;

    };
    environment.systemPackages = with pkgs; [
      grim
      slurp
      swappy
      satty
      wl-clipboard
      wl-clip-persist
      cliphist
      xwayland-satellite # xwayland support
    ];
    systemd.tmpfiles.rules = [
      "d /home/sileanth/Pictures/Screenshots 0755 sileanth users - -"
    ];
  };
}
