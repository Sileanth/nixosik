{
  config,
  pkgs,
  ...
}: let
  funny = with pkgs; [
    cowsay
    lolcat
    neofetch
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
  ];
in {
  imports = [];
  options = {};
  config = {
    home.packages = funny ++ productive;
  };
  # ...
}