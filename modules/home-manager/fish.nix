{
  config,
  pkgs,
  ...
}: {
  imports = [];
  options = {};
  config = {
    programs.starship.enableFishIntegration = true;
    programs.fish = {
      enable = true;
      functions = {
        ll = "lsd -al";
        g = "git";
        ga = " git add -A";
        lazy-vim = ''NVIM_APPNAME="lazyvim" nvim'';
        astro-vim = ''NVIM_APPNAME="astro-vim" nvim'';
        
        fish_greeting = ''
          echo "󰄛 󰩃 "
          echo elo
        '';
      };
    };
  };
}
