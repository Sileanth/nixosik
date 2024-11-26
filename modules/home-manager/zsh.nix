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
    defaultKeymap = "vicmd";
    # shellAliases = {}; # use Shell aliases
    initExtra = "[[ ! -r '/home/sileanth/.opam/opam-init/init.zsh' ]] || source '/home/sileanth/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null";
  };

}
