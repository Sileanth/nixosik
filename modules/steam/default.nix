{config, pkgs, ...}:

{
  nixpkgs.overlays = [
    (final: prev: {
      steam = prev.steam.override ({ extraPkgs ? pkgs': [], ... }: {
        extraPkgs = pkgs': (extraPkgs pkgs') ++ (with pkgs'; [
          libjpeg
          giflib
          gst_all_1.gst-plugins-base
          libxslt
          libva
          vulkan-loader
          gtk3
          ocl-icd
          xorg.libXcomposite
          xorg.libXinerama
          libgcrypt
          sqlite
          libpng
          libpulseaudio
          ncurses
          gnutls
          mpg123
          openal
          v4l-utils
          libgpg-error
          alsa-plugins
          wine-staging
          alsa-lib
           libgdiplus
        ]);
      });
    })
  ];
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
}
