{
  lib,
  config,
  ...
}:
let
  cfg = config.mc.bluetooth;
in
{

  imports = [
  ];

  options = {
    mc.bluetooth = {
      enable = lib.mkEnableOption "enable bluetooth";
    };

  };
  config = lib.mkIf cfg.enable {
  hardware.bluetooth = {
  enable = true;
  powerOnBoot = false;
};

  };
}
