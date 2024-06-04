{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [];
  options = {};
  config = {
    home.packages = with pkgs; [
      ripgrep
      fzf
      fd
      lua-language-server
      tree-sitter
      # rust-analyzer
      bottom
      nodejs
      python3
      gdu
      sqls
      nil
      inputs
      .rustaceanvim
      .packages
      .${pkgs.system}
      .codelldb # better debuger
    ];
    programs.neovim = {
      enable = true;
      viAlias = true;
      defaultEditor = true;
    };
    xdg.configFile.nvim = {
      source = ./nvim;
      target = "nvim";
      recursive = true;
      enable = true;
    };
  };
  # ...
}
