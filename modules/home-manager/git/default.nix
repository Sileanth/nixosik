{
  config,
  pkgs,
  ...
}: {
  imports = [];
  options = {};
  config = {
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
