{
  lib,
  config,
  ...
}:
let
  cfg = config.mc.kitty;
in
{

  imports = [
  ];

  options = {
    mc.kitty = {
      enable = lib.mkEnableOption "enable kityy";
    };

  };
  config = lib.mkIf cfg.enable {
    home-manager.users.sileanth = {
        programs.kitty = {
            enable = true;
            shellIntegration = {
                enableFishIntegration = true;
                enableZshIntegration = true;
            };
        };
    };
  };
}
