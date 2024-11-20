{
  config,
  pkgs,
  inputs,
  outputs,
  lib,
  ...
}: let
  cfg = config.homeHyprland;
in {
  options = {
    homeHyprland.low-power = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };
  imports = [
    ./hyprpaper.nix
  ];
  config = {
    home.packages = with pkgs; [
      hyprpaper
      waybar
      kitty
      wofi
      pavucontrol
      cliphist
      udiskie
      wl-clipboard
      wl-clip-persist
      hyprpolkitagent
      grim
      slurp
      inputs.pyprland.packages.${pkgs.system}.default
    ];


    home.file."/home/sileanth/.config/hypr/pyprland.toml".source = ./pyprland.toml;

    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

      settings = {
        exec-once = [
          "uwsm app -- waybar"
          "systemctl --user start hyprpolkitagent"
          "uwsm app -- pypr"
          "wl-paste --type text --watch cliphist store #Stores only text data"
          "wl-paste --type image --watch cliphist store #Stores only image data"
          "wl-clip-persist --clipboard both"
          "uwsm app -- udiskie"
          "powerprofilesctl set power-saver"
        ];
        input = {
          kb_layout = "pl";
          kb_variant = "legacy";
          kb_options = "ctrl:nocaps"; # remap caps to ctl
        };

        general = {
          gaps_in = 0;
          gaps_out = 0;
          border_size = 3;
          "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";
          layout = "dwindle";
        };
        # disable ghost monitor from nvidia
        monitor = "Unknown-1,disable";

        decoration = {
          rounding = 2;
          blur = {
            enabled = ! cfg.low-power;
            size = 3;
            passes = 1;
          };

        };

        animations = {
          enabled = ! cfg.low-power;
        };

        master = {
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
          "$mainMod, R, exec, wofi --show drun --width=400px --height=300px"

          # clipboard
          "$mainMod, O, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"

          # screenshots
          ", Print, exec, grim -g \"\$(slurp -d)\" - | wl-copy"

          # pyprland
          "$mainMod,P,exec,pypr toggle volume"
          "$mainMod,A,exec,pypr toggle term"

          # Move focus with mainMod + arrow keys
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"

          # Move focus with vim like bindings
          "$mainMod, H, movefocus, l"
          "$mainMod, L, movefocus, r"
          "$mainMod, K, movefocus, u"
          "$mainMod, J, movefocus, d"

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
          "SUPER,9,workspace,9"

          # move client to worpskace
          "SUPER $mainMod SHIFT, 1, movetoworkspacesilent, 1"
          "SUPER $mainMod SHIFT, 2, movetoworkspacesilent, 2"
          "SUPER $mainMod SHIFT, 3, movetoworkspacesilent, 3"
          "SUPER $mainMod SHIFT, 4, movetoworkspacesilent, 4"
          "SUPER $mainMod SHIFT, 5, movetoworkspacesilent, 5"
          "SUPER $mainMod SHIFT, 6, movetoworkspacesilent, 6"
          "SUPER $mainMod SHIFT, 7, movetoworkspacesilent, 7"
          "SUPER $mainMod SHIFT, 8, movetoworkspacesilent, 8"
          "SUPER $mainMod SHIFT, 9, movetoworkspacesilent, 9"

          "SUPER SHIFT, H, movewindow, l"
          "SUPER SHIFT, L, movewindow, r"
          "SUPER SHIFT, K, movewindow, u"
          "SUPER SHIFT, J, movewindow, d"
        ];

        bindm = [
          # Move/resize windows with mainMod + LMB/RMB and dragging
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];
      };
    };
  };
}
