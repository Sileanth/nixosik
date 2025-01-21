{pkgs, config, ...}:

{
  services.ollama = {
    enable = true;
acceleration = "cuda";

  };
  services.nextjs-ollama-llm-ui = {
    enable = true;
  };
}
