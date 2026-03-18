{ config, pkgs, pkgsunstable, ... }:
{
  # Benutzerinfos
  home.username = "vm";
  home.homeDirectory = "/home/vm";
  home.stateVersion = "25.11";

  # Shells
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw";
      ll  = "ls -la --color=auto";
      gs  = "git status";
      gp  = "git push";
      ni  = "nix-env -iA"; # nix install shortcut
    };
  };
  programs.zsh.enable = true;
  programs.fish.enable = true;

  home.packages = [
    pkgs.librewolf
#    pkgsunstable.neovim 
  ];
  # Pakete (aus pkgs-unstable)

  # Git Konfiguration
 # programs.git = {
  #  enable = true;
   # userName = "VM User";
   # userEmail = "vm@example.com";
 #   globalConfig = {
  #    "color.ui" = "auto";
   #   "core.editor" = "nvim";
   # };
 # };

  # Editor Einstellungen
#  programs.neovim = {
 #   enable = true;
   # vimAlias = true;
  #  extraConfig = ''
    #  set number
     # syntax on
 #     set tabstop=4
   #   set shiftwidth=4
  #    set expandtab
    #  filetype plugin indent on
   # '';
 # };

  # SSH & GPG
#  home.ssh.enable = true;
 # home.ssh.authorizedKeys.keys = [
  #  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC..."
#  ];

#  home.gpg.agent.enable = true;

  # Fonts
 # fonts.fonts = with pkgs-unstable; [
  #  dejavu_fonts
   # nerd-fonts-fira-code
   # jetbrains-mono
 # ];

  # Environment Variables
 # home.sessionVariables = {
   # EDITOR = "nvim";
    #VISUAL = "nvim";
   # LANG = "en_US.UTF-8";
  #  PATH = "${pkgs-unstable.nodejs}/bin:${pkgs-unstable.python311}/bin:${pkgs-unstable.go}/bin:$PATH";
 # };

  # Services
#  home.services = {
   # gpg-agent.enable = true;
  #  ssh-agent.enable = true;
 # };

  # Extra Bashrc
 # home.file.".bashrc".text = ''
  #  export HISTCONTROL=ignoredups:erasedups
   # export HISTSIZE=10000
    #export HISTFILESIZE=20000
 #   shopt -s histappend
  #  eval "$(direnv hook bash)"
   # eval "$(starship init bash)"
 # '';

  # Extra Zshrc
 # home.file.".zshrc".text = ''
  #  export HISTSIZE=10000
   # export SAVEHIST=20000
 #   setopt append_history
#    eval "$(direnv hook zsh)"
  #  eval "$(starship init zsh)"
 # '';#
}
