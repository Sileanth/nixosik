{ configs, pkgs, ... }:
{

  home-manager.users.sileanth = {
    home.packages = with pkgs; [
      pavucontrol
    ];

    programs.waybar = {
      enable = false;

      style =
        let
          # Define Tokyo Night colors as a string variable
          # Source: https://github.com/catppuccin/waybar/blob/main/themes/tokyo-night.css
          tokyoNightStyle = ''
            @define-color bg          #1a1b26;
            @define-color fg          #c0caf5;
            @define-color black       #414868;
            @define-color red         #f7768e;
            @define-color green       #9ece6a;
            @define-color yellow      #e0af68;
            @define-color blue        #7aa2f7;    /* Primary Blue */
            @define-color magenta     #bb9af7;
            @define-color cyan        #7dcfff;    /* Brighter Cyan */
            @define-color white       #a9b1d6;
            @define-color orange      #ff9e64;
            @define-color comment     #565f89;
            @define-color hint        #737aa2;
            @define-color error       #ff007c;
            @define-color gutter_fg   #364573;
            @define-color sel_bg      #292e42;
            @define-color border      #292e42;
            @define-color bg_alt      #24283b; /* Fallback/darker blueish tint */
            @define-color bg_lighter  #2c3043; /* Used for island containers, lighter blueish tint */
          '';

          # Define Catppuccin Mocha colors as a string variable (for easy switching)
          catppuccinMochaStyle = ''
            @define-color rosewater #f5e0dc;
            @define-color flamingo #f2cdcd;
            @define-color pink       #f5c2e7;
            @define-color mauve      #cba6f7;
            @define-color red        #f38ba8;
            @define-color maroon     #eebebe;
            @define-color peach      #fab387;
            @define-color yellow     #f9e2af;
            @define-color green      #a6e3a1;
            @define-color teal       #94e2d5;
            @define-color sky        #89dceb;
            @define-color sapphire   #74c7ec;
            @define-color blue       #89b4fa;
            @define-color lavender   #b4befe;
            @define-color text       #cdd6f4;
            @define-color subtext0   #a6adc8;
            @define-color subtext1   #bac2de;
            @define-color overlay0   #6c7086;
            @define-color overlay1   #7f849c;
            @define-color overlay2   #9399b2;
            @define-color surface0   #313244; /* Used for module backgrounds */
            @define-color surface1   #45475a;
            @define-color surface2   #585b70;
            @define-color base       #1e1e2e;
            @define-color mantle     #181825; /* Used for island containers */
            @define-color crust      #11111b;
          '';

          # Choose which style to apply
          selectedStyle = tokyoNightStyle;
          # selectedStyle = catppuccinMochaStyle;

        in
        ''
          ${selectedStyle}

          * {
            font-family: JetBrainsMono Nerd Font Mono;
            font-size: 14px;
            border: none;
            min-height: 0;
            /* Removed border-radius from global selector */
          }

          window#waybar {
            background: @bg;
            color: @fg;
            border-radius: 0; /* Make the Waybar itself not rounded */
          }

          /* --- Individual Module Styling for Blue Tones --- */

          #workspaces {
            padding: 0 10px;
            margin: 3px 5px;
            background: @blue; /* Primary blue for workspaces */
            border-radius: 10px; /* Explicitly keep rounded corners */
          }


          #workspaces button.active {

            background: @cyan; /* Primary blue for workspaces */
          }

          #clock {
            padding: 0 10px;
            margin: 3px 5px;
            background: @blue; /* Cyan for clock */
            border-radius: 10px; /* Explicitly keep rounded corners */
          }

          #pulseaudio {
            padding: 0 10px;
            margin: 3px 5px;
            background: @blue; /* Magenta (purplish-blue) for pulseaudio */
            border-radius: 10px; /* Explicitly keep rounded corners */
          }

          #battery {
            padding: 0 10px;
            margin: 3px 5px;
            background: @hint; /* A lighter blueish-grey hint color for battery */
            border-radius: 10px; /* Explicitly keep rounded corners */
          }

          #tray {
            padding: 0 10px;
            margin: 3px 5px;
            background: @comment; /* A darker blueish-grey comment color for tray */
            border-radius: 10px; /* Explicitly keep rounded corners */
          }

          /* --- End Individual Module Styling --- */

          #battery.warning {
            color: @yellow;
          }

          #battery.critical {
            color: @red;
          }

          /* Styling for the island effect */
          .modules-left,
          .modules-center,
          .modules-right {
            background: @bg_lighter; /* Still using bg_lighter for the "island" containers */
            margin: 3px;
            border-radius: 10px; /* Keep rounded corners for the island containers */
            padding: 0px;
          }
        '';

      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 30;
          output = [
            "eDP-1"
            "HDMI-A-1"
            "DP-1"
          ];

          modules-left = [
            "hyprland/workspaces"
          ];

          modules-center = [
            "clock"
          ];
          modules-right = [
            "tray"
            "pulseaudio"
            "battery"
          ];

          "battery" = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{icon} {capacity}%";
            format-charging = "󰂄 {capacity}%";
            format-plugged = "󱘖 {capacity}%";
            format-icons = [
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
            on-click = "";
            tooltip = false;
          };
          "clock" = {
            format = "  {:L%H:%M}";
            tooltip = true;
            tooltip-format = "<big>{:%A, %d.%B %Y }</big>\n<tt><small>{calendar}</small></tt>";
          };

          "hyprland/window" = {
            max-length = 22;
            separate-outputs = false;
          };

          "pulseaudio" = {
            format = "{icon}  {volume}% {format_source}";
            format-muted = " {format_source}";
            format-source = " {volume}%";
            format-source-muted = "";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = [
                ""
                ""
                ""
              ];
            };
            on-click = "sleep 0.1 && pavucontrol";
          };
        };
      };
    };
  };
}
