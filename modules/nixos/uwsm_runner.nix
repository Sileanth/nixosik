{lib, config, pkgs, ...}: let
	cfg = config.mc.uwsm_runner;
in {

imports = [
];

options = {
	mc.uwsm_runner = {
		enable = lib.mkEnableOption "enable uwsm_runner";
	};


};
config = lib.mkIf cfg.enable {
	programs.bash = {
		shellInit = ''
		if uwsm check may-start && uwsm select; then
			exec uwsm start default
		fi
		'';

	};
};
}

