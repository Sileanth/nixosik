{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  imports = [];
  options = {
    customModules.kde = {
      enable = mkEnableOption "customised kde";
    };
  };
  config = mkIf config.customModules.kde.enable {
    services.xserver.desktopManager.plasma6 = {
      enable = true;
      excludePackages = with pkgs.libsForQt5; [
        elisa
      ];
    };
  };
}
