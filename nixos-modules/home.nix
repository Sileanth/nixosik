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
      jetbrains.clion
      jetbrains.rider
      jetbrains.webstorm
      jetbrains.pycharm
      jetbrains.idea
      jetbrains.goland
      wireguard-tools
      vscode
      zed-editor
      lazygit

      elan
      go
      gopls


      ansible

      gemini-cli
      codex

      just
      obsidian
      ghostty
      ente-auth
      bitwarden-cli
      bitwarden-desktop
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
