{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.mc.home;
in
{

  imports = [
  ];

  options = {
    mc.home = {
      enable = lib.mkEnableOption "enable home";
    };

  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      chromium
      wireguard-tools
      vscode
      zed-editor
      lazygit
      ripgrep
      btop
      fzf
      uv

      elan
      go
      dig
      gopls

      ansible
      rustup
      rust-analyzer

      gemini-cli
      pnpm
      nodejs
      codex
      opencode
      clang
      clang-tools
      bear


      just
      obsidian
      ghostty
      ente-auth
    ];
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.sileanth = {
        home.stateVersion = "26.05";
      };
    };
  };
}
