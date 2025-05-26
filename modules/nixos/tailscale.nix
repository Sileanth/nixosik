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

	networking.extraHosts = if cfg.enable_homelab then 
	''
	100.81.52.31 calibre.home	
	100.81.52.31 miniflux.home
	100.81.52.31 mealie.home
	100.81.52.31 paperless.home
	100.81.52.31 chomik.home
	100.81.52.31 paperless.home
	'' 
  else
	''
	192.168.1.222 calibre.home	
	192.168.1.222 miniflux.home
	192.168.1.222 mealie.home
	192.168.1.222 chomik.home
	192.168.1.222 paperless.home
	'';
};
}

