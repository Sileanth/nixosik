{
  config,
  pkgs,
  ...
}: {
  imports = [];
  options = {};
  config = {
    programs.kitty = {
      enable = true;
      themeFile = "Catppuccin-Latte";
      shellIntegration = {
        enableZshIntegration = true;
        enableFishIntegration = true;
      };
      extraConfig = ''
        shell fish
      '';
    };
  };
}
