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
    services.desktopManager.plasma6.enable = true;
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the KDE Plasma Desktop Environment.
    services.xserver.displayManager.sddm.enable = true;
    services.xserver.displayManager.sddm.theme = "sddm-astronaut" ;
     environment.systemPackages = with pkgs; [
    sddm-themes.sddm-astronaut
    ];
    services.xserver.displayManager.sddm.wayland.enable = true;
  };
}
