{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.mc.kdeconnect;
in
{

  imports = [
  ];

  options = {
    mc.kdeconnect = {
      enable = lib.mkEnableOption "enable kdeconnect";
    };

  };
  config = lib.mkIf cfg.enable {
    home-manager.users.sileanth = {
    };
    networking.firewall = rec {
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
    };
    programs.kdeconnect = {
      enable = true;

    };
  };
}
