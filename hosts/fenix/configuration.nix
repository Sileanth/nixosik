# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  outputs,
  lib,
  ...
}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    outputs.nixosModules.ssd
    outputs.nixosModules.waydroid
    outputs.nixosModules.postgres
    outputs.nixosModules.ssd
    outputs.nixosModules.nvidia
    outputs.nixosModules.virtual
    outputs.nixosModules.docker
    outputs.nixosModules.flatpak
    outputs.nixosModules.hyprland
    outputs.nixosModules.fonts
    outputs.nixosModules.nixpkgs
    outputs.nixosModules.nix-lsp
    outputs.nixosModules.steam
    outputs.nixosModules.ollama
    outputs.nixosModules.ssh
    outputs.nixosModules.keyboard
    outputs.nixosModules.wireguard
    outputs.nixosModules.windows
    # outputs.nixosModules.wireguard
    #    outputs.nixosModules.systemdboot
  ];
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "fenix"; # Define your hostname.

  networking.interfaces.enp5s0 = {
    wakeOnLan.enable = true;
  };
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.xrdp.enable = true;
services.xrdp.defaultWindowManager = "startplasma-x11";
services.xrdp.openFirewall = true;

  services.displayManager.sddm.theme = "sddm-astronaut" ;



  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "pl";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "pl2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sileanth = {
    isNormalUser = true;
    description = "sileanth";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      neovim
      gh
      git
      kdePackages.kate
      #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  # nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = (with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
      sddm-themes.sddm-astronaut
    vim

    ]) ++ (with pkgs.kdePackages;[
 qt5compat
    qtsvg
    qtmultimedia
    qtvirtualkeyboard
    ]);

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedUDPPorts = [
    3389
  ];
  networking.firewall.allowedTCPPorts = [
    80
    443
    3389
  ];
networking.firewall.allowedTCPPortRanges = [
    {
        from = 1714;
        to = 1764;
      }
  ];
  networking.firewall.allowedUDPPortRanges = [
    {
        from = 1714;
        to = 1764;
      }
  ];

  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
