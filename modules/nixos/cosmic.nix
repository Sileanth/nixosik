{lib, config, pkgs, ...}: let
	cfg = config.mc.cosmic;
in {

imports = [
];

options = {
	mc.cosmic = {
		enable = lib.mkEnableOption "enable cosmic";
	};


};
config = lib.mkIf cfg.enable {
    services.desktopManager.cosmic.enable = true;
};
}

