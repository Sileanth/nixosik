{
  config,
  pkgs,
  ...
}: {
  imports = [];
  options = {};
  config = {
    programs.zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
  };
}
