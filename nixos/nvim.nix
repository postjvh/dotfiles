{ config, pkgs, ... }:

let
  plugins = pkgs.callPackage ./vim/plugins.nix {};
in
{
  environment.systemPackages = with pkgs; [
    neovim-qt
    neovim-pygui
    (neovim.override {
      vimAlias = true;
      configure = {
        customRC = builtins.readFile ./dotfiles/.vimrc;
        vam.knownPlugins = vimPlugins // plugins;
        vam.pluginDictionaries = [
          { names = [
              "neomake"
              "vim-polyglot"
              "youcompleteme"
              "vimproc"
              "syntastic"
              "tabular"
              "tlib"
              "ghcmod"
              "necoghc"
              "hindent"
              "vim2hs"
              "nerdtree"
              "ctrlp"
              "surround"
              "nerdcommenter"
              "airline"
              "airline-themes"
              "fugitive"
              "multiple-cursors"
              "gitgutter"
              "signify"
              "toml"
              "fsharp"
              "elm"
              "kuvim-themes"
              "papercolor-theme"
              "spacemacs-theme"
              "quantum-theme"
              "colorschemes"
              "colorstepper"
          ]; }
          # { names = [
          #   # "elm-vim"
          #   # # "ghc-mod-vim"
          #   # # "neco-ghc"
          # ]; }
        ];
      };
    })
  ];
}
