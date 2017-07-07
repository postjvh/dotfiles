{ config, pkgs, ... }:

let
  global = (import ./global.nix);
in
  {
    networking = {
      hostName = "moon";
      domain = "${global.userName}.local";
      # fix for missing hosts entry https://github.com/NixOS/nixpkgs/issues/1248
      extraHosts = ''
        127.0.0.1 moon.${global.userName}.local moon
        ::1 moon.${global.userName}.local moon
      '';
      # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
      # useDHCP = false;
      # interfaces = {
      #   wlp2s0.ip4 = [
      #     { address = "192.168.8.152"; prefixLength = 24; }
      #   ];
      # };
      networkmanager.enable = true;
      nameservers = [];
      firewall = {
        enable = true;
        allowPing = true;
        allowedTCPPorts = [ 22 ];
        allowedUDPPorts = [];
      };
    };
  }