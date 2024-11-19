{
  config,
  pkgs,
  ...
}: {
  imports = [];
  options = {};
  config = {
    programs.yazi = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      shellWrapperName = "y";
    };
  };
}
