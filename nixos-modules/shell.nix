{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.mc.shell;
in
{

  imports = [
  ];

  options = {
    mc.shell = {
      enable = lib.mkEnableOption "enable shell";
    };

  };
  config = lib.mkIf cfg.enable {

    home-manager.users.sileanth = {
      home.shellAliases = {
        ksh = "kitten ssh";

      };
      home.shell = {
        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
      };
      home.packages = with pkgs; [
        tree-sitter
        gcc


        tldr
        fzf
        bat
      ];
      programs = {
        zsh = {
          enable = true;
          autocd = true;
          autosuggestion = {
            enable = true;

          };
          syntaxHighlighting = {
            enable = true;
            highlighters = [
              "brackets"

            ];
          };
        };
        starship = {
          enable = true;
          enableZshIntegration = true;
          enableFishIntegration = true;

        };
        yazi = {
          enable = true;
          enableZshIntegration = true;
          enableFishIntegration = true;

        };

        zoxide = {
          enable = true;
          enableZshIntegration = true;
          enableFishIntegration = true;
        };

        lazygit = {
          enable = true;
          enableZshIntegration = true;
          enableFishIntegration = true;
        };

        lsd = {
          enable = true;
          enableZshIntegration = true;
          enableFishIntegration = true;
        };
        direnv = {
          nix-direnv.enable = true;
          silent = true;
          enable = true;
          enableZshIntegration = true;
          enableFishIntegration = true;
        };

      };

    };

  };
}
