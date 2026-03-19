{ pkgs }:

pkgs.writeShellScriptBin "hello" ''
echo "Hello $USER from a Nix package"
''
