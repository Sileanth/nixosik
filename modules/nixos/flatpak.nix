{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [];
  options = {
  };
  config = {
    services.flatpak.enable = true;
    users.users.sileanth.packages = with pkgs; [
      gnome-software
      kdePackages.discover
    ];
  };
}
