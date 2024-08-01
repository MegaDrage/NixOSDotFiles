{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./nvidia.nix
      ./fonts.nix
      ./syncthing.nix
      ./docker.nix
      ./polkit.nix
      ./scripts/merge-scripts.nix
    ];

  environment.shells = with pkgs; [ zsh ];
  programs.zsh.enable = true;


  boot = {
    kernelParams = [ "nvidia-drm.modeset=1" "nvidia-drm.fbdev=1" ];
    kernelPackages = pkgs.linuxPackages_latest;
    extraModprobeConfig = "options nouveau modeset=0";
    # initrd.kernelModules = [ "amdgpu" ];
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        enable = true;
        devices = ["nodev"];
        efiSupport = true;
        useOSProber = true;
        configurationLimit = 10;
      };
      timeout = 10;
    };  
  };
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  hardware.enableRedistributableFirmware = true;
  time = {
    timeZone = "Asia/Novosibirsk";
    hardwareClockInLocalTime = true;
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "ru_RU.UTF-8";
      LC_IDENTIFICATION = "ru_RU.UTF-8";
      LC_MEASUREMENT = "ru_RU.UTF-8";
      LC_MONETARY = "ru_RU.UTF-8";
      LC_NAME = "ru_RU.UTF-8";
      LC_NUMERIC = "ru_RU.UTF-8";
      LC_PAPER = "ru_RU.UTF-8";
      LC_TELEPHONE = "ru_RU.UTF-8";
      LC_TIME = "ru_RU.UTF-8";
    };
  };

  services = {
    xserver = {
      enable = true;
      xkb.layout = "us,ru";
      desktopManager.gnome.enable = true;
      displayManager = {
        gdm = {
          enable = true;
          wayland = true;
        };
      };
    };
    printing.enable = true;
  };

  hardware.pulseaudio.enable = false;

  services.flatpak.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  security.pam.services.hyprland.enableGnomeKeyring = true;
  programs.seahorse.enable = true;

  users.users.megadrage = {
    isNormalUser = true;
    description = "MegaDrage";
    extraGroups = [ "wheel" "input" "docker" "video" "networkmanager" "rfkill" "audio" "network" ];
  };

  nixpkgs.config.allowUnfree = true;
  services.fwupd.enable = true;
  environment.systemPackages = with pkgs; [

    scribus
    inkscape

    brightnessctl
    playerctl
    pamixer
    libsecret
    networkmanagerapplet
    eww
    ags
    
    onlyoffice-bin 
    obs-studio
    blender
    ferium
    wget
    glxinfo
    fastfetch
    telegram-desktop
    lshw
    pciutils
    xwaylandvideobridge
    xwayland
		xdg-utils
  	xdg-desktop-portal
  	xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
		xdg-user-dirs
    gnome.gnome-software
    gnome-tweaks
    obsidian

    zed-editor
    nnn

    zathura
    gitnuro
    chromium
    btop
    eza
    qt6.qtwayland
    qt5.qtwayland
    acpi
    libnotify
    superfile
    powertop
  ];

  environment.pathsToLink = [ "/share/zsh" ];

  programs.direnv.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  
  security.polkit = {
    enable = true; 
  };

  xdg.portal = {
		enable = true;
	};

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.variables.EDITOR = "nvim";

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 8384 22000 80 81 443];
    allowedUDPPorts = [ 80 81 443 22000 21027 ];
  };

  system.autoUpgrade = {    
    enable = true;
    channel = "https://nixos.org/channels/nixos-unstable";
  };

  #Garbage collection
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };
  
  hardware = {
    steam-hardware = {
	enable = true;
    }; 
    graphics = {
      enable = true;
      enable32Bit = true;
      
      extraPackages = with pkgs; [
        vulkan-validation-layers 
      ];

      extraPackages32 = with pkgs.pkgsi686Linux; [ 
        libva 
      ];
    };
  };

  users.defaultUserShell = pkgs.zsh;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  }; 

  programs.dconf.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
