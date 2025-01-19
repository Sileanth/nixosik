{
  config,
  pkgs,
  ...
}: {
  imports = [];
  options = {};
  config = {
    programs.wofi = {
      enable = true;
    };
  };
}
