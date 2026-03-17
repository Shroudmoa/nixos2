{ config, pkgs, ... }:

{
  home.username = "vm";
  home.homeDirectory = "/home/vm";
  home.stateVersion = "25.11";
  programs.bash = {
      enable = true;
      shellAliases = {
          btw = "echo i use nixos btw";
    };
  };
}
