{
  config,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  home.packages = with pkgs; [
    hyprpaper
    waybar
    kitty
    wofi
    pavucontrol
    inputs.pyprland.packages.${pkgs.system}.default
  ];
  home.file."/home/sileanth/.config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;

  home.file."/home/sileanth/.config/hypr/wallpapers" = {
    source = ./wallpapers;
    recursive = true;
  };

  home.file."/home/sileanth/.config/hypr/pyprland.toml".source = ./pyprland.toml;

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      exec-once = [
        "waybar"
        "hyprpaper"
	"pypr"
      ];
      input = {
        kb_layout = "pl";
        kb_variant = "legacy";
        kb_options = "ctrl:nocaps"; # remap caps to ctl
      };

      general = {
        gaps_in = 5;
        gaps_out = 2;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      master = {
        new_is_master = false;
      };

      # keybindings names
      "$mainMod" = "SUPER";
      "$left" = "mouse:272";
      "$right" = "mouse:273";

      bind = [
        "$mainMod, Q, exec, kitty"
        "$mainMod, F, exec, firefox"
        "$mainMod, D, exec, dolphin"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, wofi --show drun"

	# pyprland
	"$mainMod,P,exec,pypr toggle volume"
	"$mainMod,A,exec,pypr toggle term"

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        #shift worpskaces
        "SUPER,1,workspace,1"
        "SUPER,2,workspace,2"
        "SUPER,3,workspace,3"
        "SUPER,4,workspace,4"
        "SUPER,5,workspace,5"
        "SUPER,6,workspace,6"
        "SUPER,7,workspace,7"
        "SUPER,8,workspace,8"

        # move client to worpskace
        "SUPER $mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "SUPER $mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "SUPER $mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "SUPER $mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "SUPER $mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "SUPER $mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "SUPER $mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "SUPER $mainMod SHIFT, 8, movetoworkspacesilent, 8"

        "SUPER SHIFT, left, movewindow, l"
        "SUPER SHIFT, right, movewindow, r"
        "SUPER SHIFT, up, movewindow, u"
        "SUPER SHIFT, down, movewindow, d"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
