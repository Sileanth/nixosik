{lib, config, pkgs, ...}: let
	cfg = config.mc.keyboard;
in {

imports = [
];

options = {
	mc.keyboard = {
		enable = lib.mkEnableOption "enable keyboard managment";
	};


};
config = lib.mkIf cfg.enable {
	hardware.keyboard.qmk.enable = true;
	environment.systemPackages = with pkgs; [
     		vial
		via
	];
	services.udev.packages = [ pkgs.via ];
};

}

