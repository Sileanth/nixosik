{lib, config, disko, ...}: let
	cfg = config.mc.disko_default;
in {

imports = [
];

options = {
	mc.disko_default = {
		enable = lib.mkEnableOption "enable default full disk luks + btrfs subvolumes setup";
		disk = lib.mkOption {
			type = lib.types.str;
			default = "/dev/nvme0n1";
		};
		swap_size = lib.mkOption {
			type = lib.types.str;
			default = "16";
		};
		efi_size = lib.mkOption {
			type = lib.types.str;
			default = "1024";
		};
	};


};
config = lib.mkIf cfg.enable {
  fileSystems."/persist".neededForBoot = true;
  fileSystems."/secret".neededForBoot = true;
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = cfg.disk;
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "${cfg.efi_size}M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted";
                # disable settings.keyFile if you want to use interactive password entry
                # passwordFile = "/tmp/secret.key"; # Interactive
                settings = {
                  allowDiscards = true;
                  # keyFile = "/tmp/secret.key";
                };
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];
		  postCreateHook = ''
			MNTPOINT=$(mktemp -d)
			mount -o subvol=/ /dev/mapper/crypted "$MNTPOINT"
			trap 'umount $MNTPOINT; rm -rf $MNTPOINT' EXIT
			btrfs subvolume snapshot -r $MNTPOINT/root $MNTPOINT/root-blank
		  '';
                  subvolumes = {
                    "/root" = {
                      mountpoint = "/";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "/persist" = {
                      mountpoint = "/persist";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "/secret" = {
                      mountpoint = "/secret";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "/home" = {
                      mountpoint = "/home";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "/nix" = {
                      mountpoint = "/nix";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    "/swap" = {
                      mountpoint = "/swap";
                      swap.swapfile.size = "${cfg.swap_size}G";
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
};
}

