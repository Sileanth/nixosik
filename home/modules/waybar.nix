{configs, pkgs, ...}:
{



home-manager.users.sileanth = {
	home.packages = with pkgs; [
		pavucontrol

	];


    programs.waybar = {
    	enable = true;

	# style = ''
	# 	  * {
	# 	    font-family: JetBrainsMono Nerd Font Mono;
	# 	    font-size: 14px;
	# 	    border-radius: 0px;
	# 	    border: none;
	# 	    min-height: 0px;
	# 	  }
	# 	'';

	settings = {
	mainBar = {
		layer = "top";
		position = "top";
		height = 30;
		output = [
			"eDP-1"
      "HDMI-A-1"
		];





		modules-left = [
			"hyprland/workspaces"
		];

		modules-center = [
			# "hyprland/window"
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
		    format = ''  {:L%H:%M}'';
		    tooltip = true;
		    tooltip-format = "<big>{:%A, %d.%B %Y }</big>\n<tt><small>{calendar}</small></tt>";
		  };

		  "hyprland/window" = {
		    max-length = 22;
		    separate-outputs = false;
		    # rewrite = {
		    #   "" = " 🙈 No Windows? ";
		    # };
		  };



		   "pulseaudio" = {
		    format = "{icon}  {volume}% {format_source}";
		    # format-bluetooth-muted = " {icon} {format_source}";
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
