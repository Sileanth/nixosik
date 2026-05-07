{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.mc.nvim;
in
{

  imports = [
  ];

  options = {
    mc.nvim = {
      enable = lib.mkEnableOption "enable nvim";
    };

  };
  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      package = inputs.neovim-nightly.packages.${pkgs.system}.default;

    };

  };
}
