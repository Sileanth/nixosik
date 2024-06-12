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

        serwer-ssh = "ssh ubuntu@158.178.144.114 -i ~/.ssh/main";

        fish_greeting = ''
          echo "󰄛 󰩃 "
          echo elo
        '';
      };
    };
  };
}
