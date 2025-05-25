{lib, config, pkgs, ...}: let
	cfg = config.mc.bootloader;
  mkIfElse = p: yes: no: lib.mkMerge [
    (lib.mkIf p yes)
    (lib.mkIf (!p) no)
  ];
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
config = 
  let 
    grubConfig = {
      boot.loader.grub.enable = true;
      boot.loader.grub.default = "saved";
      boot.loader.grub.efiSupport = true;
      boot.loader.grub.efiInstallAsRemovable = true;
        boot.loader.grub.device = "nodev";
      boot.loader.grub.extraEntries =
          ''
            menuentry "Windows" {
              insmod part_gpt
              insmod fat
              insmod search_fs_uuid
              insmod chain
              search --fs-uuid --set=root 7C30-1BC2
              chainloader /EFI/Microsoft/Boot/bootmgfw.efi
            }
          '' 
          + ''
             menuentry "Reboot" {
                reboot
            }

            menuentry "Shut Down" {
                halt
            }
          '';
    };
    systemdConfig = {
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
    };
in 
  mkIfElse (cfg.type == "grub") grubConfig systemdConfig;


}

