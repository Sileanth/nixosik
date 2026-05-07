{ config, lib, pkgs, ... }:

let
  cfg = config.mc.wireguard;
  
  main_public = "84.235.172.161";
  main_pubkey = "M8rtUwJJ73SSFVBOk/Ev/UslxRNDpgqI+JCm9/kA60I="; # Replace this
  helios_vpn = "10.200.0.2";
in
{
  options.mc.wireguard = {
    enable = lib.mkEnableOption "WireGuard VPN client";
  };

  config = lib.mkIf cfg.enable {
    networking.wg-quick.interfaces.wg0 = {
      address = [ "${helios_vpn}/24" ];
      privateKeyFile = "/etc/wireguard/private.key";

      peers = [
        {
          publicKey = main_pubkey;
          allowedIPs = [ "10.200.0.0/24" ];
          endpoint = "${main_public}:51820";
          persistentKeepalive = 25;
        }
      ];
    };

    # Ensure wireguard-tools is available
    environment.systemPackages = [ pkgs.wireguard-tools ];
    
    # Open firewall for WireGuard
    networking.firewall.allowedUDPPorts = [ 51820 ];
  };
}
