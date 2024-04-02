# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    outputs.homeManagerModules.simple-cli
    outputs.homeManagerModules.latex
    outputs.homeManagerModules.nvim
    outputs.homeManagerModules.shell
    outputs.homeManagerModules.git
    outputs.homeManagerModules.kitty
    outputs.homeManagerModules.fish
    outputs.homeManagerModules.hyprland
    

    outputs.homeManagerModules.kdecus

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      outputs.overlays.nvim-nightly

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "sileanth";
    homeDirectory = "/home/sileanth";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;

  home.packages = with pkgs; [
    unstable.go
    unstable.nh
    unstable.jetbrains-toolbox
    unstable.rustup
    unstable.vscode

    unstable.opam
    gnumake
    coq
    coqPackages.coqide
    coqPackages.coq-lsp
    gcc

    unstable.smlnj
    unstable.millet #sml lsp

    libsForQt5.yakuake # dropdown terminal
    libsForQt5.plasma-browser-integration

    discord
    spotify

    unstable.nil # nix lsp
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
