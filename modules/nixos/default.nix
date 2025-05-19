let
	disko_default = import ./disko_default.nix;
	hyprland = import ./hyprland.nix;
	fonts = import ./fonts.nix;
	tailscale = import ./tailscale.nix;
	uwsm_display_manager = import ./uwsm_display_manager.nix;
in {


	inherit disko_default;	
	inherit hyprland;
	inherit fonts;
	inherit uwsm_display_manager;
	inherit tailscale;
	all = [
		uwsm_display_manager 
		disko_default
		hyprland
		fonts
		tailscale
	];


}
