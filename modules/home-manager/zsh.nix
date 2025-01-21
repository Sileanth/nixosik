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
    # shellAliases = {}; # use non standard shell alias
    initExtra = ''
      psh() {
          local host
          host=$(grep -E '^[[:space:]]*host[[:space:]]+' ~/.ssh/config | awk '{print $2}' | fzf --height=10 --border --prompt="Select host: ")
          ssh $host
      }


    [[ ! -r '/home/sileanth/.opam/opam-init/init.zsh' ]] || source '/home/sileanth/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
    '';
  };

}
