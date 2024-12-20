# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  outputs,
  inputs,
  lib,
  config,
  pkgs,
  nix-colors,
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
    outputs.homeManagerModules.waybar
    outputs.homeManagerModules.fish
    outputs.homeManagerModules.wofi
    outputs.homeManagerModules.starship
    outputs.homeManagerModules.hyprland

    outputs.homeManagerModules.kdecus
    outputs.homeManagerModules.emacs
    outputs.homeManagerModules.ocaml
    outputs.homeManagerModules.yazi
    outputs.homeManagerModules.zoxide
    outputs.homeManagerModules.zsh
    outputs.homeManagerModules.color_scheme

    # Or modules exported from other flakes (such as nix-colors):
    inputs.nix-colors.homeManagerModules.default

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
      outputs.overlays.stable-packages

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

  # tempory TODO FIX
  # home.enableNixpkgsReleaseCheck = false;
  home = {
    username = "sileanth";
    homeDirectory = "/home/sileanth";
  };

  # Add stuff for your user as you see fit:
  home.packages = let
    stable_packages = with pkgs.stable; [
      go
      jetbrains-toolbox
      sysstat
      tmux
      yt-dlp
      mpv
      gnumake
      gparted
      coq
      foot
      openvpn
      iodine
      dig


      coqPackages.coqide
      coqPackages.coq-lsp

      gcc
      calibre
      vlc
      roslyn
      roslyn-ls


      wireguard-tools
      erlang
      elixir
      inotify-tools
      chromium
      libreoffice
      xdot

      gnum4
      xspim
    ];
    unstable_packages = with pkgs.unstable; [
      agda
      agdaPackages.standard-library
      idris2


      dotnet-sdk_9
      # scala
      # metals
      # ammonite
      # sbt
      # mill
      jdk
      coursier



      vscode
      discord
      webcord
      helix
      zellij
      spotify-qt
      librespot
      spotifyd
      spotify-player
      gnome-decoder

      godot_4

      nil

      ghc
      stack
      haskell-language-server
      elan
      cabal-install

      authenticator
      bitwarden-desktop
      zed-editor
      zotero

      nh
      rustup
      nodePackages.typescript-language-server
    ];
  in
    stable_packages ++ unstable_packages;

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
