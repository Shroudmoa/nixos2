{ config, lib, pkgs, pkgsunstable, ... }:

{
  imports =
    [ 
      
      ./hardware-configuration.nix      
    ];
 # home-manager.useUserPackagers = true;
 # home-manager.useGlobalPkgs = true;
 # home-manager.backupFileExtension = "backup";
 # home-manager.users.vm = import ./home.nix;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "MyVM"; 
  #networking.wireless.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # plasma
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

 
  console.keyMap = "de";
  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };
  services.xserver.libinput.enable = true;

  #Don't forget to set a password with ‘passwd’.
  users.users.vm = {
    isNormalUser = true;
    description = "vm";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
  bat
  xclip
  git
  fastfetch
  ] ++ [
  pkgsunstable.firefox
  pkgsunstable.kitty
  pkgsunstable.wezterm
  pkgsunstable.ttyd
  ];
  services.openssh.enable = true;
system.stateVersion = "25.11"; # Did you read the comment? No

}
