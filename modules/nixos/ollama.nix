{pkgs, config, ...}:

{
  services.ollama = {
    enable = true;
    nextjs-ollama-llm-ui.enable = true;


  };
}
