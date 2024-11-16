{
  config,
  pkgs,
  ...
}: {
  imports = [];
  options = {};
  config = {
    programs.gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      settings = {
        rc = "repo clone";
      };
    };
    programs.git = {
      enable = true;
      userName = "sileanth";
      userEmail = "lukasz.magnuszewski@gmail.com";
      aliases = {
        cm = "commit -m";
      };
    };
  };
  # ...
}
