{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.mc.docker;
in
{

  imports = [
  ];

  options = {
    mc.docker = {
      enable = lib.mkEnableOption "enable docker";
    };

  };
  config = lib.mkIf cfg.enable {
    home-manager.users.sileanth = {
    };
    virtualisation.docker = {
      enable = true;
    };
    users.users.sileanth.extraGroups = [ "docker" ];
    environment.systemPackages = with pkgs; [
      docker-compose
    ];
  };
}
