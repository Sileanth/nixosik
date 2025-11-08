{
  lib,
  config,
  disko,
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
        xwayland-satellite # xwayland support
    ];
  };
}
