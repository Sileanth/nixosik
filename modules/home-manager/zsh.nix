{config, pkgs, inputs, outputs, ...}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    autocd = true;
    autosuggestion = {
      enable = true;
    };
    dotDir = ".config/zsh";
  };

}
