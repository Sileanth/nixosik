{pkgs, ...}:
{
    hardware.keyboard.qmk.enable = true;
      services.udev.packages = with pkgs; [
    vial
    via
  ];
  environment.systemPackages = with pkgs; [
    vial
    via
  ];
  }
