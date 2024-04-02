{config, pkgs, ...}:

{
  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
  services.jellyfin = {
    enable = true;
  };


  # Remove sound.enable or set it to false if you had it set previously, as sound.enable is only meant for ALSA-based configurations

}
