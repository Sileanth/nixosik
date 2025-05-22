{lib, config, pkgs, ...}: let
	cfg = config.mc.tailscale;
in {

imports = [
];

options = {
	mc.tailscale = {
		enable = lib.mkEnableOption "enable tailscale";
		enable_homelab = lib.mkEnableOption "enable dns for homelab with taiscale ips";
	};


};
config = lib.mkIf cfg.enable {
	services.tailscale = {
		enable = true;
	};

	networking.extraHosts = lib.mkIf cfg.enable_homelab 
	''
	100.81.52.31 calibre.home	
	100.81.52.31 miniflux.home
	100.81.52.31 mealie.home
	100.81.52.31 paperless.home

	'';
};
}

