{config, pkgs, inputs, outputs, ...}:
{
   networking.firewall = {
    allowedUDPPorts = [ 51820 ]; # Clients and peers can use the same port, see listenport
  };
  # Enable WireGuard
  # networking.wireguard.interfaces = {
  #   # "wg0" is the network interface name. You can name the interface arbitrarily.
  #   wg0 = {
  #     # Determines the IP address and subnet of the client's end of the tunnel interface.
  #     ips = [ "10.8.0.2/24" "fd09:fb6a:9381::2/64" ];
  #     listenPort = 51820; # to match firewall allowedUDPPorts (without this wg uses random port numbers)
  #
  #     dns = [ "8.8.8.8" "1.1.1.1" ];
  #     # Path to the private key file.
  #     #
  #     # Note: The private key can also be included inline via the privateKey option,
  #     # but this makes the private key world-readable; thus, using privateKeyFile is
  #     # recommended.
  #     privateKeyFile = "/home/sileanth/wireguard-keys/private.key";
  #
  #     peers = [
  #       # For a client configuration, one peer entry for the server will suffice.
  #
  #       {
  #         # Public key of the server (not a file path).
  #         publicKey = "Tv4reg4iorvC9aXJVKsHq0WUc/NuqAd5oRnXmYbb2EQ=";
  #
  #         # Forward all the traffic via VPN.
  #         allowedIPs = [ "0.0.0.0/0" ];
  #         # Or forward only particular subnets
  #         #allowedIPs = [ "10.100.0.1" "91.108.12.0/22" ];
  #
  #         # Set this to the server IP and port.
  #         endpoint = "91.204.161.22:51820"; # ToDo: route to endpoint not automatically configured https://wiki.archlinux.org/index.php/WireGuard#Loop_routing https://discourse.nixos.org/t/solved-minimal-firewall-setup-for-wireguard-client/7577
  #
  #         # Send keepalives every 25 seconds. Important to keep NAT tables alive.
  #         persistentKeepalive = 25;
  #       }
  #     ];
  #   };
  # };
  networking.wg-quick.interfaces = { 
    wg0 = {
      autostart = true;
      address =   [ "10.8.0.2/24" "fd09:fb6a:9381::2/64" ];
      dns = ["2001:4860:4860::8888" "1.1.1.1" "8.8.8.8" ];
      # dns =  [ "10.8.0.1/24" "fd09:fb6a:9381::1/64" ];
      privateKeyFile = "/home/sileanth/wireguard-keys/private.key";
      peers = [
        {
            publicKey = "Tv4reg4iorvC9aXJVKsHq0WUc/NuqAd5oRnXmYbb2EQ=";
            allowedIPs = [  "::/0" "0.0.0.0/0"];
            endpoint = "91.204.161.22:51820";
          }


      ];
    };
  };
}
