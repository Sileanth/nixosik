{config, pkgs, ...}:

{
  hardware.opengl.driSupport32Bit = true;
  environment.systemPackages = with pkgs; [
    (lutris.override {
      extraLibraries =  pkgs: [
        giflib
        libpng
        gnutls
        openal
        mpg123
        v4l-utils
        libpulseaudio
        libgpg-error
        alsa-plugins
        alsa-lib
        libjpeg
        sqlite
        xorg.libXcomposite
        xorg.libXinerama
        libgcrypt
        ncurses
        ocl-icd
        libxslt
        libva
        gtk3
        vulkan-loader
        gst_all_1.gst-plugins-base
        # List library dependencies here
      ];
      extraPkgs = pkgs: [
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
         # List package dependencies here
       ];
    })
  ];
}
