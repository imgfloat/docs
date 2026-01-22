{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = [
    pkgs.python312
    pkgs.nodePackages.vscode-json-languageserver
    pkgs.cairo
    pkgs.uv
  ];
  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.cairo
    pkgs.pango
    pkgs.gdk-pixbuf
    pkgs.libffi
  ];
}
