{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.mc.quickshell;
in
{

  imports = [
  ];

  options = {
    mc.quickshell = {
      enable = lib.mkEnableOption "enable quickshell";
    };

  };
  config = lib.mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      quickshell
    ];
  };
}
