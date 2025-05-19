let
	disko_default = import ./disko_default.nix;
	hyprland = import ./hyprland.nix;
	fonts = import ./fonts.nix;
	tailscale = import ./tailscale.nix;
in {


	inherit disko_default;	
	inherit hyprland;
	inherit fonts;
	inherit tailscale;
	all = [
		disko_default
		hyprland
		fonts
		tailscale
	];


}
