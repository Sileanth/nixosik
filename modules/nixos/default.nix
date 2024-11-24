# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  # List your module files here
  # my-module = import ./my-module.nix;
  fonts = import ./fonts.nix;
  nvidia = import ./nvidia.nix;
  kde = import ./kde.nix;
  virtual = import ./virtual.nix;
  flatpak = import ./flatpak.nix;
  hyprland = import ./hyprland.nix;
  docker = import ./docker.nix;
  postgres = import ./postgres.nix;
  steam = import ./steam.nix;
  low-power = import ./low-power.nix;
  ssd = import ./ssd.nix;
  minegrub = import ./minegrub.nix;
  calibre-server = import ./server/calibre-server.nix;
  freshrss = import ./server/freshrss.nix;
  ssh = import ./server/ssh.nix;
  systemdboot = import ./systemdboot.nix;
  nixpkgs = import ./nixpkgs.nix;
  nix-lsp = import ./nix_lsp.nix;
  wireguard = import ./wireguard.nix;
}
