{
  config,
  inputs,
  outputs,
  pkgs,
  ...
}:

{

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
       "/home/sileanth/.config/hypr/wallpapers/kitten.jpg" 
      ];

      wallpaper = [
        "HDMI-A-1,/home/sileanth/.config/hypr/wallpapers/kitten.jpg"
      ];
      
    };

  };
}
