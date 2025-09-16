{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.mc.fonts;
in
{

  imports = [
  ];

  options = {
    mc.fonts = {
      enable = lib.mkEnableOption "enable fonts";
    };

  };
  config = lib.mkIf cfg.enable {
    fonts.packages = with pkgs; [
      nerd-fonts.symbols-only
    ];
  };
}
