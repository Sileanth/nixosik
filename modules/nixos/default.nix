let
	disko_default = import ./disko_default.nix;
	hyprland = import ./hyprland.nix;
	fonts = import ./fonts.nix;
	tailscale = import ./tailscale.nix;
	uwsm_runner = import ./uwsm_runner.nix;
in {


	inherit disko_default;	
	inherit hyprland;
	inherit fonts;
	inherit uwsm_runner;
	inherit tailscale;
	all = [
		uwsm_runner 
		disko_default
		hyprland
		fonts
		tailscale
	];


}
