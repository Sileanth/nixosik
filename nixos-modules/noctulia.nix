{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
let
  cfg = config.mc.noctulia;
in
{

  imports = [
  ];

  options = {
    mc.noctulia = {
      enable = lib.mkEnableOption "enable noctulia";
    };

  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      noctalia-shell
    ];
    home-manager.users.sileanth = {
      # # import the home manager module
      # imports = [
      #   inputs.noctalia.homeModules.default
      # ];
      #
      # # configure options
      # programs.noctalia-shell = {
      #   enable = true;
      #   #settings = {};
      # };
    };
  };
}
