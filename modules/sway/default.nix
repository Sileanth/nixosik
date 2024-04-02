{pkgs, ...}: {
  # wiki suggests that 
  security.polkit.enable = true;
  # Optional, hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
