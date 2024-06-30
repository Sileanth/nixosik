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
      passwordFile = "/run/secrets/freshrss";
      enable = true;
      baseUrl = "http://192.168.1.13/feshrss";
    };
  };
}
