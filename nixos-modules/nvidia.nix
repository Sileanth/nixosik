{
  lib,
  config,
  ...
}:
let
  cfg = config.mc.nvidia;
in
{

  imports = [
  ];

  options = {
    mc.nvidia = {
      enable = lib.mkEnableOption "enable nvidia";
    };

  };
  config = lib.mkIf cfg.enable {
    hardware.graphics.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia = {
      open = true;
      nvidiaSettings = true;
      powerManagement.finegrained = false;
      modesetting.enable = true;
    };
  };
}
