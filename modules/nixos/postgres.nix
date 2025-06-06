{lib, config, pkgs, ...}: let
	cfg = config.mc.postgres;
in {

imports = [
];

options = {
	mc.postgres = {
		enable = lib.mkEnableOption "enable postgres";
	};


};
config = lib.mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      pgcli
    ];
    config.services.postgresql = {
      enable = true;
      # ensureDatabases = [ "mydatabase" ];
      authentication = pkgs.lib.mkOverride 10 ''
        #type database  DBuser  auth-method
        local all       all     trust
      '';
    };
};
}

