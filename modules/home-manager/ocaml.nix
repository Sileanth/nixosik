{
  config,
  pkgs,
  inputs,
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
inputs
      .opam2nix
      .packages
      .${pkgs.system}
      .opam2nix# better debuger


    ];
  };
}
