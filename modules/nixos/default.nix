let
	disko_default = import ./disko_default.nix;
	keyboard = import ./keyboard.nix;
	hyprland = import ./hyprland.nix;
	fonts = import ./fonts.nix;
	tailscale = import ./tailscale.nix;
	uwsm_display_manager = import ./uwsm_display_manager.nix;
  windows = import ./windows.nix;
in {

	inherit keyboard;
	inherit disko_default;	
	inherit hyprland;
	inherit fonts;
	inherit uwsm_display_manager;
	inherit tailscale;
  inherit windows;
	all = [
    windows
		uwsm_display_manager 
		disko_default
		hyprland
		fonts
		tailscale
		keyboard
	];


}
