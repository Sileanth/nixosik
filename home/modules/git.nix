{ configs, pkgs, ... }:
{

  home-manager.users.sileanth = {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "sileanth";
          email = "sileanth@sileanth.pl";
        };

      };


    };

    programs.gh = {
      enable = true;
      settings = {
        editor = "nvim";
      };
      gitCredentialHelper = {
        enable = true;
      };

    };
    programs.lazygit = {
      enable = true;
    };
  };
}
