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
    services.thermald.enable = true;
  };
}
