{lib, config, pkgs, ...}: let
	cfg = config.mc.uwsm_display_manager;
in {

imports = [
];

options = {
	mc.uwsm_display_manager = {
		enable = lib.mkEnableOption "enable uwsm_display_manager";
		skip_choice = lib.mkOption {
		 	description = "skip choice of Window Manager";
			default = false;
			type = lib.types.bool;
		};
		default_option = lib.mkOption {
			type = lib.types.str;
			default = "hyprland-uwsm.desktop";
			description = "which window manager to run by default";
		};
		auto_login = {
			enable = lib.mkEnableOption "enable tty autologin";
			user = lib.mkOption {
				type = lib.types.str;
				default = "sileanth";
				description = "user to automaitcly login to tty";
			};
		};
	};


};
config = lib.mkIf cfg.enable {
	services.getty.autologinUser = lib.mkIf cfg.auto_login.enable cfg.auto_login.user;
	programs.bash = {
		shellInit = if cfg.skip_choice 
		then 
		''
		if uwsm check may-start; then
		    exec uwsm start ${cfg.default_option}
		fi	
		''
		else
		''
		if uwsm check may-start && uwsm select; then
			exec uwsm start default
		fi
		'';

	};
};
}

