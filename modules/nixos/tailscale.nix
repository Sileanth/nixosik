{lib, config, pkgs, ...}: let
	cfg = config.mc.tailscale;
in {

imports = [
];

options = {
	mc.tailscale = {
		enable = lib.mkEnableOption "enable tailscale";
	};


};
config = lib.mkIf cfg.enable {
	services.tailscale = {
		enable = true;
	};
};
}

