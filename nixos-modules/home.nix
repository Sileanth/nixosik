{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.mc.home;
in
{

  imports = [
  ];

  options = {
    mc.home = {
      enable = lib.mkEnableOption "enable home";
    };

  };
  config = lib.mkIf cfg.enable {
	  environment.systemPackages = with pkgs; [ 
		jetbrains.clion
		jetbrains.rider
		jetbrains.webstorm
		jetbrains.pycharm
		jetbrains.idea


		just
	  ];
    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.sileanth = {
            home.stateVersion = "25.11";
        };
    };
  };
}
