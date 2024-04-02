{
  config,
  pkgs,
  ...
}: {
  imports = [];
  options = {};
  config = {
    programs.starship = {
      enable = true;
    };
  };
}
