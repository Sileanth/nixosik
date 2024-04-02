{config, pkgs, ... }:


{

	programs.fish = {
    enable = true;

    interactiveShellInit = "
      starship init fish | source
      zoxide init fish | source
      source /home/sileanth/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
    ";

    shellAliases = {
      "g" = "git";
      "lazy-vim" = "NVIM_APPNAME=lazy-vim nvim";
      "chad-vim" = "NVIM_APPNAME=chad-vim nvim";
      "astro-vim" = "NVIM_APPNAME=astro-vim nvim";
      "evim" = "NVIM_APPNAME=evim nvim";
      "ll" = "lsd -all";
      "lg" = "lazygit";

    };

    functions = {
      fish_greeting = "";

    };
    

  };
	


}
