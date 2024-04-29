{ pkgs }: {
  deps = [
    pkgs.llvmPackages_rocm.bintools-unwrapped
    pkgs.vim
    pkgs.mesa-demos
    pkgs.bashInteractive
    pkgs.nodePackages.bash-language-server
    pkgs.man
  ];
}