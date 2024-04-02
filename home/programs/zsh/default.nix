{config, pkgs, ... }:


{

	programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    autocd = true;
    initExtra = "
      $HOME/.cargo/env
    ";

  };
	


}
