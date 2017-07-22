{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Terminal emulators
    enlightenment.terminology
    # Common
    wget curl htop inetutils zip unzip
    dbus dbus_daemon
    # Internet
    vivaldi slack
    # Office
    evince keepass
  ];
}
