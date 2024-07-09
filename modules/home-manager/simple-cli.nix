{
  config,
  pkgs,
  ...
}: let
  funny = with pkgs; [
    cowsay
    lolcat
  ];

  productive = with pkgs; [
    lsd
    bat
    btop
    zoxide
    lazygit
    tldr
    thefuck
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
