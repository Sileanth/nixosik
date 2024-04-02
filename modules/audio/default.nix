{config, pkgs, ...}:

{

  # Remove sound.enable or set it to false if you had it set previously, as sound.enable is only meant for ALSA-based configurations
   users.users.sileanth.packages = with pkgs; [
    pavucontrol
   ];

  hardware.pulseaudio.enable = false;
 
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  }; 

}
