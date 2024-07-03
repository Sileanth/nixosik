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
      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
        device = "nodev";
      };

    };
  };
}
