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
    xdg.configFile."waybar/config" = {
      enable = true;
      source = ./config;
    };
    xdg.configFile."waybar/style.css" = {
      enable = true;
      source = ./style.css;
    };
  };
}
