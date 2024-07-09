{
  config,
  pkgs,
  ...
}: {
  imports = [];
  options = {};
  config = {
    home.packages = with pkgs; [
      gh
    ];
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
