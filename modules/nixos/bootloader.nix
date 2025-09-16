{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.mc.bootloader;
  mkIfElse =
    p: yes: no:
    lib.mkMerge [
      (lib.mkIf p yes)
      (lib.mkIf (!p) no)
    ];
  hollow-grub = pkgs.stdenv.mkDerivation {
    name = "hollow-grub";
    src = pkgs.fetchFromGitHub {
      owner = "sergoncano";
      repo = "hollow-knight-grub-theme";
      rev = "7ae57b6";
      sha256 = "sha256-tV87/7Gc+LpRvSMpgWJ+x/qrW2cbR/3pmoZA3TT/JHU=";
    };
    installPhase = ''
      mkdir -p $out/grub/themes/hollow-grub
      cp -rp hollow-grub $out/grub/themes
    '';
  };
in
{

  imports = [
  ];

  options = {
    mc.bootloader = {
      enable = lib.mkEnableOption "enable bootloader";

      type = lib.mkOption {
        description = "grub or systemdboot";
        default = "systemdboot";
        type = lib.types.enum [
          "grub"
          "systemdboot"
        ];
      };
    };

  };
  config =
    let
      grubConfig = {
        boot.loader.grub.enable = true;
        boot.loader.grub.default = "saved";
        boot.loader.grub.theme = "${hollow-grub}/grub/themes/hollow-grub";
        boot.loader.grub.efiSupport = true;
        boot.loader.grub.efiInstallAsRemovable = true;
        boot.loader.grub.device = "nodev";
        boot.loader.grub.useOSProber = true;
        boot.loader.grub.extraEntries =
          # ''
          #   menuentry "Windows" {
          #     insmod part_gpt
          #     insmod fat
          #     insmod search_fs_uuid
          #     insmod chain
          #     search --fs-uuid --set=root 7C30-1BC2
          #     chainloader /EFI/Microsoft/Boot/bootmgfw.efi
          #   }
          # '' +
          ''
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
