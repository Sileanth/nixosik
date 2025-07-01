let
	disko_default = import ./disko_default.nix;
	keyboard = import ./keyboard.nix;
	hyprland = import ./hyprland.nix;
	fonts = import ./fonts.nix;
	tailscale = import ./tailscale.nix;
	uwsm_display_manager = import ./uwsm_display_manager.nix;
  windows = import ./windows.nix;
  bootloader = import ./bootloader.nix;
  kdeconnect = import ./kdeconnect.nix;
  gaming = import ./gaming.nix;
  virt = import ./virt.nix;
  postgres = import ./postgres.nix;
  cosmic = import ./cosmic.nix;
  ollama = import ./ollama.nix;
in {
  inherit cosmic;
  inherit kdeconnect;
  inherit virt;
	inherit keyboard;
	inherit disko_default;	
	inherit hyprland;
	inherit fonts;
	inherit uwsm_display_manager;
	inherit tailscale;
  inherit windows;
  inherit bootloader;
  inherit gaming;
  inherit postgres;
  inherit ollama;
	all = [
    ollama
    cosmic
    virt
    postgres
    gaming
    kdeconnect
    bootloader
    windows
		uwsm_display_manager 
		disko_default
		hyprland
		fonts
		tailscale
		keyboard
	];


}
