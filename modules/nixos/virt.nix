{lib, config, pkgs, ...}: let
	cfg = config.mc.virt;
in {

imports = [
];

options = {
	mc.virt = {
		enable = lib.mkEnableOption "enable virt";
	};


};
config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
    };
    users.users.sileanth.extraGroups = [ "docker" ];
    environment.systemPackages = with pkgs; [
      docker-compose
    ];
};
}

