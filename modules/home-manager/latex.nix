{
  config,
  pkgs,
  ...
}: {
  imports = [];
  options = {};
  config = {
    home.packages = with pkgs; [
      stable.texlive.combined.scheme-full
    ];
  };
}
