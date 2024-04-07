{ pkgs }: {
  deps = [
    pkgs.vim
    pkgs.mesa-demos
    pkgs.bashInteractive
    pkgs.nodePackages.bash-language-server
    pkgs.man
  ];
}