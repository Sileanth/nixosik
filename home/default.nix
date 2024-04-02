{pkgs, ... }:

{
  imports = [
	./wm/hyprland
  ./programs/dunst
  ./programs/foot
  ./programs/helix
	./programs/nvim
  ./programs/zsh
  ./programs/fish
  ./programs/kitty
  ./programs/waybar
  # ./programs/atuin
  ./wm/sway
  ];
programs.nix-index =
{
  enable = true;
  enableFishIntegration = true;
  enableZshIntegration = true;
};


nixpkgs.overlays = [

(
  self: super : {
    koka = super.koka.overrideDerivation (old : {
      version = "2.6.0";

    });

  }

)

];



  home.username = "sileanth";
  home.homeDirectory = "/home/sileanth";
  home.packages = with pkgs; [
    cargo
    rustc
    luajitPackages.lua-lsp
    jetbrains-toolbox
    gparted
    readline
    p7zip
    ncurses
    koka
    qemu
    python311Packages.pip
    virt-manager
    wine-staging
    ollama
    distrobox
    eff
    ripgrep
    lutris
    guix
    libsForQt5.kdeconnect-kde
    gdu
    bottom
    fd
    qbittorrent
    dash
    pomodoro
    nodejs_21
    poetry
    python3
    python311Packages.pynvim
    lunarvim
    thunderbird
    pandoc
    gdb
    gnome.pomodoro
    gnumake
    discord
    emacs
    steam
    lazygit
    starship
    btop
    bat
    duf
    du-dust
    zoxide
    procs
    stdmanpages
    man-pages-posix
    man-pages
    tldr
    mono
    jetbrains-toolbox
    opam

    elan

    coq
    coqPackages.coqide
    coqPackages.coq-lsp

    kitty
    typst
    typst-lsp
    typst-fmt
  	
    pavucontrol
    texliveFull
    neofetch
    lsd
    spotify
    gcc
    vscode 
    cowsay
    wofi
    dolphin
    ripgrep
    fzf
    dmenu
  ];
  programs = {
	git = {
		enable = true;
		userName = "sileanth";
		userEmail = "lukasz.magnuszewski@gmail.com";

	};
	kitty = {
		enable = true;
	};
  };
  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

}
