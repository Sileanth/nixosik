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
    networking.firewall.enable = false;
    services.calibre-web = {
      enable = true;
      openFirewall = true;
      options.enableBookUploading = true;
    };
  };
}
