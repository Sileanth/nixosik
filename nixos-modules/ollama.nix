{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.mc.ollama;
in
{

  imports = [
  ];

  options = {
    mc.ollama = {
      enable = lib.mkEnableOption "enable ollama";
    };

  };
  config = lib.mkIf cfg.enable {
    home-manager.users.sileanth = {
    };
    services.ollama = {
      enable = true;
      package = pkgs.ollama-cuda;
      loadModels = [ "qwen3.5:9b" ];

    };
  };
}
