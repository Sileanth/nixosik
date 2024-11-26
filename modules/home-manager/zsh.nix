{config, pkgs, inputs, outputs}:
{
  environment.pathsToLink = [ "/share/zsh" ];
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
