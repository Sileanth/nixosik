# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  # List your module files here
  # my-module = import ./my-module.nix;
  simple-cli = import ./simple-cli.nix;
  latex = import ./latex.nix;
  shell = import ./shell;
  nvim = import ./programs/nvim;
  git = import ./git;
  kdecus = import ./kde;
  hyprland = import ./hyprland;
  kitty = import ./kitty.nix;
  fish = import ./fish.nix;
  starship = import ./starship.nix;
  wofi = import ./wofi.nix;
}
