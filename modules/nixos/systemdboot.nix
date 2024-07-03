{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  imports = [];
  options = {
  };
  config = {
    boot.loader = {
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/efi/";
      systemd-boot = {
        enable = true;

      };
      

    };
  };
}
