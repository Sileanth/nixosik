{pkgs, inputs, ...}:
{
  
  users.users.sileanth.openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIESV2HAKj2KFZ4Xi3UJV4DHug/QfXjIOhNykkGUA1sg3 lukasz.magnuszewski@gmail.com"];
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = ["sileanth"]; # Allows all users by default. Can be [ "user1" "user2" ]
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "no"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
  };
};
}
