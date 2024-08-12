{
  config,
  pkgs,
  ...
}: let
  funny = with pkgs; [
    cowsay
    fastfetch
    macchina
    lolcat
  ];

  productive = with pkgs; [
    lsd
    bat
    jq
    poetry
    btop
    zoxide
    lazygit
    tldr
    glow
    skate
    mdcat
    wezterm
  ];
in {
  imports = [];
  options = {};
  config = {
    home.packages = funny ++ productive;
  };
  # ...
}
