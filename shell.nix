{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = [
    pkgs.python312
    pkgs.nodePackages.vscode-json-languageserver
    pkgs.uv
  ];
}
