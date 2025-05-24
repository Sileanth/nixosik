{lib, config, pkgs, ...}: let
	cfg = config.mc.bootloader;
in {

imports = [
];

options = {
	mc.bootloader = {
		enable = lib.mkEnableOption "enable bootloader";

		type = lib.mkOption {
		 	description = "grub or systemdboot";
			default = "systemdboot";
			type = lib.types.enum ["grub" "systemdboot" ];
		};
	};


};
config = {
  lib.mkIf (cfg.type == "grub") {
    boot.loader.grub.enable = true;
    boot.loader.grub.default = saved;
    boot.loader.grub.efiSupport = true;
    boot.loader.grub.efiInstallAsRemovable = true;
    extraEntries =
        (if config.mc.windows.enable then
        ''
          menuentry "Windows" {
            insmod part_gpt
            insmod fat
            insmod search_fs_uuid
            insmod chain
            search --fs-uuid --set=root 7C30-1BC2
            chainloader /EFI/Microsoft/Boot/bootmgfw.efi
          }
        '' else "")
        + ''
           menuentry "Reboot" {
              reboot
          }

          menuentry "Shut Down" {
              halt
          }
        '';

  };

  lib.mkIf (cfg.type == "systemdboot") {

    # Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

  };


};
}

