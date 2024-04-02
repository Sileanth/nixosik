{
  config,
  pkgs,
  ...
}: {
  imports = [];
  options = {};
  config = {
    programs.waybar = {
      enable = true;


    };
    xdg.configFile."config" = {
      enable = true;
      source = ./config;
    };
    xdg.configFile."style.css" = {
      enable = true;
      source = ./style.css;
    };
  };
}
