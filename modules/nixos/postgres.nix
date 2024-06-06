{
  pkgs,
  lib,
  config,
  ...
}: {
  users.users.sileanth.packages = with pkgs; [
    pgcli
  ];
  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    # port = 5432;
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
        host  all      all     127.0.0.1/32   trust
            host all       all     ::1/128        trust
        local all      all     trust
    '';
    ensureDatabases = [ "sileanth" ];
    ensureUsers = [ {
      name = "sileanth";
      ensureDBOwnership = true;
      ensureClauses = {
        createdb = true;
        createrole = true;
      };
    } ];

  };
}
