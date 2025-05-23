{configs, pkgs, ...}:
{



home-manager.users.sileanth = {
	home.packages = with pkgs; [
		wofi
		pulsemixer
		wl-clipboard
		clipse

		brightnessctl
		playerctl

		kdePackages.polkit-kde-agent-1
		# TODO hyprpolkitagent


	];

programs.hyprlock = {
	enable = true;
	settings = {
	  general = {
	    disable_loading_bar = true;
	    grace = 10;
	    hide_cursor = true;
	    no_fade_in = false;
	  };

	  background = [
	    {
	      path = "screenshot";
	      blur_passes = 3;
	      blur_size = 8;
	    }
	  ];

	  input-field = [
	    {
	      size = "200, 50";
	      position = "0, -80";
	      monitor = "";
	      dots_center = true;
	      fade_on_empty = false;
	      font_color = "rgb(202, 211, 245)";
	      inner_color = "rgb(91, 96, 120)";
	      outer_color = "rgb(24, 25, 38)";
	      outline_thickness = 5;
	      placeholder_text = "'\'Password...'\'";
	      shadow_passes = 2;
	    }
	  ];
	};

};

wayland.windowManager.hyprland = {
systemd.enable = false;
enable = true;
xwayland.enable = true;
settings = {
	exec-once = [
		"uwsm app -- clipse -listen"
		"uwsm app -- waybar"

	];
	monitor = [
		"eDP-1, 1920x1080@144, 0x0, 1"
		", preferred, auto, 1, mirror, eDP-1"
		# ",preffered,auto,auto"
	];
	
	env = [
		"XCURSOR_SIZE,24"
		"HYPRCURSOR_SIZE,24"
	];

	general = {
		gaps_in = 5;
		gaps_out = 0;
		border_size= 1;

		# https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
		"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
		"col.inactive_border" = "rgba(595959aa)";

		# Set to true enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false;

		# Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
		allow_tearing = false;

		layout = "dwindle";
	};



	# https://wiki.hyprland.org/Configuring/Variables/#decoration
	decoration = {
	    rounding = 10;

	    # Change transparency of focused and unfocused windows
	    active_opacity = 1.0;
	    inactive_opacity = 1.0;

	    shadow = {
		enabled = true;
		range = 4;
		render_power = 3;
		color = "rgba(1a1a1aee)";
	    };

	    # https://wiki.hyprland.org/Configuring/Variables/#blur
	    blur = {
		enabled = true;
		size = 3;
		passes = 1;

		vibrancy = 0.1696;
	    };
	};


	# https://wiki.hyprland.org/Configuring/Variables/#animations
	animations = {
	    enabled = "no";

	    # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

	    bezier = [
		    "easeOutQuint,0.23,1,0.32,1"
		    "easeInOutCubic,0.65,0.05,0.36,1"
		    "linear,0,0,1,1"
		    "almostLinear,0.5,0.5,0.75,1.0"
		    "quick,0.15,0,0.1,1"
	    ];
	    animation = [
		"global, 1, 10, default"
		"border, 1, 5.39, easeOutQuint"
		"windows, 1, 4.79, easeOutQuint"
		"windowsIn, 1, 4.1, easeOutQuint, popin 87%"
		"windowsOut, 1, 1.49, linear, popin 87%"
		"fadeIn, 1, 1.73, almostLinear"
		"fadeOut, 1, 1.46, almostLinear"
		"fade, 1, 3.03, quick"
		"layers, 1, 3.81, easeOutQuint"
		"layersIn, 1, 4, easeOutQuint, fade"
		"layersOut, 1, 1.5, linear, fade"
		"fadeLayersIn, 1, 1.79, almostLinear"
		"fadeLayersOut, 1, 1.39, almostLinear"
		"workspaces, 1, 1.94, almostLinear, fade"
		"workspacesIn, 1, 1.21, almostLinear, fade"
		"workspacesOut, 1, 1.94, almostLinear, fade"
	    ];
	};

	dwindle = {
		pseudotile = false;
		preserve_split = true;

	};

	master = {
		new_status = "master";
	};


	misc = {
		force_default_wallpaper = -1;
		disable_hyprland_logo = false;

	};



	# https://wiki.hyprland.org/Configuring/Variables/#input
	input = {
	    kb_layout = "pl";
	    # kb_variant =
	    # kb_model =
	    # kb_options =
	    # kb_rules =

	    follow_mouse = 1;

	    sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

	    touchpad = {
		natural_scroll = false;
	    };
	};

	# https://wiki.hyprland.org/Configuring/Variables/#gestures
	gestures = {
	    workspace_swipe = true;
	};

	"$terminal" = "kitty";
	"$fileManager" = "dolphin";
	"$browser" = "firefox";
	"$menu" = "wofi --show drun";
	"$mod"= "SUPER";

	bind = [
	"$mod, Q, exec, uwsm-app -- $terminal"
	"$mod, V, exec, uwsm-app -- $terminal --class clipse -e 'clipse'"
	"$mod, P, exec, uwsm-app -- $terminal --class pulsemixer -e 'pulsemixer'"
	"$mod, B, exec, uwsm-app -- $browser"
	"$mod, R, exec, uwsm-app -- $menu"
	"$mod, E, exec, uwsm-app -- $fileManager"

	"$mod, C, killactive"
	"$mod, M, exit"
	"$mod, N, exec, uwsm-app -- hyprlock"
	"$mod, F, togglefloating"

	"$mod, left, movefocus, l"
	"$mod, right, movefocus, r"
	"$mod, up, movefocus, u"
	"$mod, down, movefocus, d"


	"$mod, H, movefocus, l"
	"$mod, L, movefocus, r"
	"$mod, J, movefocus, u"
	"$mod, K, movefocus, d"

	"$mod, 1, workspace, 1"
	"$mod, 2, workspace, 2"
	"$mod, 3, workspace, 3"
	"$mod, 4, workspace, 4"
	"$mod, 5, workspace, 5"
	"$mod, 6, workspace, 6"
	"$mod, 7, workspace, 7"
	"$mod, 8, workspace, 8"
	"$mod, 9, workspace, 9"
	"$mod, 0, workspace, 10"

	"$mod SHIFT, 1, movetoworkspace, 1"
	"$mod SHIFT, 2, movetoworkspace, 2"
	"$mod SHIFT, 3, movetoworkspace, 3"
	"$mod SHIFT, 4, movetoworkspace, 4"
	"$mod SHIFT, 5, movetoworkspace, 5"
	"$mod SHIFT, 6, movetoworkspace, 6"
	"$mod SHIFT, 7, movetoworkspace, 7"
	"$mod SHIFT, 8, movetoworkspace, 8"
	"$mod SHIFT, 9, movetoworkspace, 9"
	"$mod SHIFT, 0, movetoworkspace, 10"
		



	];
	bindm = [
		"$mod, mouse:272, movewindow"
		"$mod, mouse:273, resizewindow"
	];
	bindel = [

		# Laptop multimedia keys for volume and LCD brightness
		", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
		 ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
		" ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
		" ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
		" ,XF86MonBrightnessUp, exec, brightnessctl s 10%+"
		" ,XF86MonBrightnessDown, exec, brightnessctl s 10%-"
	];

	# Requires playerctl
	bindl = [
		" , XF86AudioNext, exec, playerctl next"
		" , XF86AudioPause, exec, playerctl play-pause"
		" , XF86AudioPlay, exec, playerctl play-pause"
		" , XF86AudioPrev, exec, playerctl previous"
	];

	# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
	# See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

	# Example windowrule v1
	# windowrule = float, ^(kitty)$

	# Example windowrule v2
	# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$

	# Ignore maximize requests from apps. You'll probably like this.
	windowrulev2 = [
		"suppressevent maximize, class:.*"
		# Fix some dragging issues with XWayland
		"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"	
		
	"float,class:(pulsemixer)" # ensure you have a floating window class set if you want this behavior
	"size 622 652,class:(pulsemixer)" # set the size of the window as necessary
	"stayfocused, class:(pulsemixer)"

	"float,class:(clipse)" # ensure you have a floating window class set if you want this behavior
	"size 622 652,class:(clipse)" # set the size of the window as necessary
	"stayfocused, class:(clipse)"

		];
	

};

};


};
}
