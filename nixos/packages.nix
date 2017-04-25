{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Security
    truecrypt
    # Common
    wget curl bind htop gksu ntfs3g inetutils
    zip unzip gparted
    # Internet
    chromium hexchat irssi dropbox qbittorrent
    tdesktop
    # Office
    octaveFull graphviz texlive.combined.scheme-full
    evince poppler_utils
    # Multimedia
    vlc exif ffmpeg gphoto2
    # Common devel
    gnumake diffuse
    redis-desktop-manager
    pgadmin
  ];
}
