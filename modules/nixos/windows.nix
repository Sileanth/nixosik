{lib, config, pkgs, ...}: let
	cfg = config.mc.windows;
in {

imports = [
];

options = {
	mc.windows = {
		enable = lib.mkEnableOption "enable windows";
	};


};
config = lib.mkIf cfg.enable {
  boot.supportedFilesystems = [ "ntfs" ];
};
}

