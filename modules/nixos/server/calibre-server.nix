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
    services.calibre-server = {
      enable = true;
    };
    services.calibre-web = {
      enable = false;
    };
  };
}
