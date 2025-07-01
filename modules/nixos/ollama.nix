{lib, config, pkgs, ...}: let
	cfg = config.mc.ollama;
in {

imports = [
];

options = {
	mc.ollama = {
		enable = lib.mkEnableOption "enable ollama";
	};


};
config = lib.mkIf cfg.enable {
    services.ollama = {
      enable = true;
      # Optional: preload models, see https://ollama.com/library
      loadModels = [ 
        "llama3.2:3b" 
        "deepseek-r1:3b"
        "qwen3:1.7b"
      ];
    };
};
}

