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
      themeFile = "Catppuccin-Mocha";
      shellIntegration = {
        enableZshIntegration = true;
        enableFishIntegration = true;
      };
      extraConfig = ''
        shell zsh
      '';
    };
  };
}
