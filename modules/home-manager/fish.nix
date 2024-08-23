{
  config,
  pkgs,
  ...
}: {
  imports = [];
  options = {};
  config = {
    programs.opam = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
    home.packages = with pkgs; [
      pkg-config
      openssl
      libev
    ];
  };
}
