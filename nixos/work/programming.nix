{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnumake
    stack cabal2nix graphviz
    texlive.combined.scheme-full
    meld
    mono46 fsharp
    maven jdk
    inotify-tools
  ];

  system.activationScripts = {
    tmuxDotfiles = {
      text = ''
        cd /home/kuznero
        if [[ -d .m2 ]]; then rm -rf .m2; fi
        mkdir .m2
        ln -fs /etc/nixos/dotfiles/.m2/settings.xml .m2/settings.xml
      '';
      deps = ["users"];
    };
  };

}
