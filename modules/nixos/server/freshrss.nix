{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [];
  options = {
  };
  config = {
    services.freshrss = {
      enable = true;
    };
  };
}
