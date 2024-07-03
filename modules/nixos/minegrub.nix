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
      efi.efiSysMountPoint = "/boot/";
      grub = {
        enable = true;
        efiSupport = true;
        default = "saved";
        device = "nodev";
        generationLimit = 5;
        extraEntries = ''
          menuentry "Windows" {
            insmod part_gpt
            insmod fat
            insmod search_fs_uuid
            insmod chain
            search --fs-uuid --set=root 7C30-1BC2
            chainloader /EFI/Microsoft/Boot/bootmgfw.efi
          }
        '' + ''
           menuentry "Reboot" {
              reboot
          }

          menuentry "Shut Down" {
              halt
          }
        '';
      };
    };
  };
}
