{lib, config, pkgs, ...}: let
	cfg = config.mc.kdeconnect;
in {

imports = [
];

options = {
	mc.kdeconnect = {
		enable = lib.mkEnableOption "enable kdeconnect";
	};


};
config = lib.mkIf cfg.enable {
  programs.kdeconnect = {
    enable = true;
  };
  networking.firewall = {
    
    allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
  };
};
}

