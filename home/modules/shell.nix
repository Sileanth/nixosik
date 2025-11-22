{ configs, pkgs, ... }:
{
  home-manager.users.sileanth = {

    programs.zoxide = {
      enable = true;

    };
    programs.direnv = {
      enable = true;
      nix-direnv = {
        enable = true;

      };
    };

    home.packages = with pkgs; [
      lsd
    ];
    home.shellAliases = {
      lg = "lazygit";
    };

    programs.fish = {
      enable = true;
    };

    programs.bash = {
      enable = true;
    };

    programs.zsh = {
      enable = true;
      autocd = true;
      autosuggestion = {
        enable = true;
      };
      dotDir = ".config/zsh";
    };

    programs.lsd = {
      enable = true;
      enableBashIntegration = false;
      enableZshIntegration = true;
      enableFishIntegration = true;
      icons = {
        filetype = {
          "justfile" = "";
        };
      };
    };

    programs.yazi = {
      enable = true;
      enableBashIntegration = false;
      enableZshIntegration = true;
      enableFishIntegration = true;
      shellWrapperName = "yy";

    };

    programs.starship = let
      configFile = builtins.readFile ./starship-cattpuccin.toml;
      configToml = builtins.fromTOML configFile;
      in {
      enableBashIntegration = false;
      enableZshIntegration = true;
      enableFishIntegration = true;
      enable = true;
      settings = configToml;
    };

    programs.kitty = {
      enable = true;
      settings = {
        shell = "zsh";
        background_opacity = 1.0;
      };
      themeFile = "tokyo_night_night";
      shellIntegration = {
        enableFishIntegration = true;
        enableZshIntegration = true;
        enableBashIntegration = true;
      };
    };

    programs.neovim.defaultEditor = true;
  };
}
