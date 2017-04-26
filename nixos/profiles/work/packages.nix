{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Common
    wget curl bind htop gksu ntfs3g inetutils
    zip unzip gparted
    # Internet
    chromium
    # Office
    octaveFull graphviz
    evince poppler_utils
    # Common devel
    gnumake diffuse
    redis-desktop-manager
    pgadmin
  ];
}