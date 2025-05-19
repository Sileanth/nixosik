# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

   networking.hostName = "athena"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
   networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
   time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };



  services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
  

  # Configure keymap in X11
  services.xserver.xkb.layout = "pl";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  services.printing.enable = true;

   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };

  services.libinput.enable = true;

   users.users.sileanth = {
	hashedPassword = "$y$j9T$gQogYTdaPPs77EGSstlq.1$B5Nw.JzCvbgDfax7QuQs5LR9XEvQJiVFk9Dtb5jhnc4";
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
	git
	gh
     ];
   };

   programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;


  system.stateVersion = "24.11"; 

}

