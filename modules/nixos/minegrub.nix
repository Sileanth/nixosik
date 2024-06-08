{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  imports = [ inputs.minegrub-theme.nixosModules.default ];
  options = {
  };
  config = {
    boot.loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
        minegrub-theme = {
          enable = true;
          splash = "I Use NixOS btw!";
          boot-options-count = 5;

        };
      };

    };
  };
}
