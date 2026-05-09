{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.mc.wireguard;

  main_public = "84.235.172.161";
  main_pubkey = "M8rtUwJJ73SSFVBOk/Ev/UslxRNDpgqI+JCm9/kA60I=";
  helios_vpn = "10.200.0.2";
in
{
  options.mc.wireguard = {
    enable = lib.mkEnableOption "WireGuard VPN client";
  };

  config = lib.mkIf cfg.enable {
    systemd.network = {
      enable = true;

      netdevs."50-wg0" = {
        netdevConfig = {
          Kind = "wireguard";
          Name = "wg0";
          Description = "WireGuard VPN to main";
        };
        wireguardConfig = {
          PrivateKeyFile = "/etc/wireguard/private.key";
          RouteTable = "main";
        };
        wireguardPeers = [
          {
            PublicKey = main_pubkey;
            AllowedIPs = [
              "10.200.0.0/24"
              "10.0.0.0/24"
            ];
            Endpoint = "${main_public}:51820";
            PersistentKeepalive = 25;
          }
        ];
      };

      networks."50-wg0" = {
        matchConfig.Name = "wg0";
        address = [ "${helios_vpn}/24" ];
        networkConfig = {
          DHCP = "no";
          LinkLocalAddressing = "no";
        };
      };
    };

    systemd.tmpfiles.rules = [
      "d /etc/wireguard 0750 root systemd-network - -"
      "z /etc/wireguard/private.key 0640 root systemd-network - -"
    ];

    environment.systemPackages = [ pkgs.wireguard-tools ];
  };
}
