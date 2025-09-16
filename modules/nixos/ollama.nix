{
  lib,
  config,
  pkgs,
  pkgs-unstable,
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
      enableWebUI = lib.mkEnableOption "enable Ollama web UI";
      webUIPort = lib.mkOption {
        type = lib.types.port;
        default = 3000;
        description = "Port for the Ollama web UI";
      };
    };

  };
  config = lib.mkIf cfg.enable {
    services.ollama = {
      # package = pkgs-unstable.ollama;
      enable = true;
      acceleration = "cuda";
      # Optional: preload models, see https://ollama.com/library
      loadModels = [
        "llama3.2:3b"
        "deepseek-r1:3b"
        "qwen3:1.7b"
      ];
    };

    services.nextjs-ollama-llm-ui = lib.mkIf cfg.enableWebUI {
      enable = true;
      port = cfg.webUIPort;
    };

    networking.firewall.allowedTCPPorts = lib.mkIf cfg.enableWebUI [ cfg.webUIPort ];
  };
}
