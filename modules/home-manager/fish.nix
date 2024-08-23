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
      shellInit = ''
        test -r '/home/sileanth/.opam/opam-init/init.fish' && source '/home/sileanth/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
      '';
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
