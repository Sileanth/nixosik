{
  lib,
  config,
  pkgs,
  pkgs-unstable,
  ...
}:
let
  cfg = config.mc.flatpak;
in
{

  imports = [
  ];

  options = {
    mc.flatpak = {
      enable = lib.mkEnableOption "enable flatpak";

    };

  };
  config = lib.mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      discover



    ];
    services.flatpak.enable = true;
    systemd.services.flatpak-repo = {
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.flatpak ];
      script = ''
        flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
      '';
    };

  };
}
