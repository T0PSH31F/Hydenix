{ config,
  pkgs, 
  inputs,
  ...
}:
let
  # Package declaration
  # ---------------------

  pkgs = import inputs.hydenix.inputs.hydenix-nixpkgs {
    inherit (inputs.hydenix.lib) system;
    config.allowUnfree = true;
    overlays = [
      inputs.hydenix.lib.overlays
      (final: prev: {
        userPkgs = import inputs.nixpkgs {
          config.allowUnfree = true;
        };
      })
    ];
  };
in
{

  # Set pkgs for hydenix globally, any file that imports pkgs will use this
  nixpkgs.pkgs = pkgs;

  nix.settings.extra-experimental-features = [ "nix-command" "flakes" ];
  
  # Disable documentation building to avoid sandbox issues
  documentation = {
    enable = true;
    doc.enable = false;
    man.enable = true;
    dev.enable = false;
    nixos.enable = false;
  };
  imports = [
    inputs.hydenix.inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    inputs.hydenix.lib.nixOsModules
    ./modules/system

    # === GPU-specific configurations ===

    /*
      For drivers, we are leveraging nixos-hardware
      Most common drivers are below, but you can see more options here: https://github.com/NixOS/nixos-hardware
    */

    #! EDIT THIS SECTION
    # For NVIDIA setups
    # inputs.hydenix.inputs.nixos-hardware.nixosModules.common-gpu-nvidia

    # For AMD setups
    # inputs.hydenix.inputs.nixos-hardware.nixosModules.common-gpu-amd

    # === CPU-specific configurations ===
    # For AMD CPUs
    # inputs.hydenix.inputs.nixos-hardware.nixosModules.common-cpu-amd

    # For Intel CPUs
    inputs.hydenix.inputs.nixos-hardware.nixosModules.common-cpu-intel

    # === Other common modules ===
    inputs.hydenix.inputs.nixos-hardware.nixosModules.common-pc
    inputs.hydenix.inputs.nixos-hardware.nixosModules.common-pc-ssd
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";  # Add backup extension for existing files
    extraSpecialArgs = {
      inherit inputs;
    };

    #! EDIT THIS USER (must match users defined below)
    users."t0psh31f" =
      { ... }:
      {
        imports = [
          inputs.hydenix.lib.homeModules
          inputs.nix-index-database.hmModules.nix-index
          ./modules/hm
        ];
      };
  };

  hydenix = {
    enable = true; 
    hostname = "Chopper";
    timezone = "America/Los_Angeles";
    locale = "en_US.UTF-8";
 
      audio.enable = true;
      boot = {
        enable = true;
        useSystemdBoot = true;
        grubTheme = pkgs.hydenix.grub-pochita; # or pkgs.hydenix.grub-retroboot
        grubExtraConfig = ""; # additional GRUB configuration
        kernelPackages = pkgs.linuxPackages_latest; 
      };
      gaming.enable = true;
      hardware.enable = true;
      network.enable = true;
      nix.enable = true;
      sddm = {
        enable = true;
       # theme = pkgs.hydenix.sddm-candy;
      };
      system.enable = true;
  };

  hardware.bluetooth.enable = true;
  
  services = {
	adguardhome.enable = true;
 	atuin.enable = true;
	# eternal-terminal.enable = true;
	homepage-dashboard.enable = true;
#	lasuite-docs.enable = false;
 	gvfs.enable = true;
	postgresql = {
		enable = true;
		package = pkgs.postgresql_15;
		enableTCPIP = true;
		authentication = pkgs.lib.mkOverride 10 ''
			local all all trust
			host all all 127.0.0.1/32 trust
			host all all ::1/128 trust
			'';
		initialScript = pkgs.writeText "backend-initScript" ''
			CREATE DATABASE leads_db;
			\c leads_db;
		-- Enable pgvector extension
			CREATE EXTENSION IF NOT EXISTS vector;
		-- Create the leads table
			CREATE TABLE leads (
			id SERIAL PRIMARY KEY,
			source_table TEXT NOT NULL,
			raw_data JSONB NOT NULL,
			email TEXT UNIQUE,
			name TEXT,
			phone TEXT,
			company TEXT,
			embedding vector(384),
			created_at TIMESTAMP NOT NULL DEFAULT NOW(),
			updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
			embedding_updated_at TIMESTAMP
			);
		-- Create indexes
			CREATE INDEX idx_leads_email ON leads(email);
			CREATE INDEX idx_leads_company ON leads(company);
			CREATE INDEX idx_leads_embedding ON leads USING ivfflat (embedding
			vector_cosine_ops) WITH (lists = 100);
		-- Create ingestion log table
			CREATE TABLE ingestion_log (
			id SERIAL PRIMARY KEY,
			file_path TEXT NOT NULL,
			file_hash TEXT NOT NULL,
			file_type TEXT NOT NULL,
			row_count INTEGER,
			staging_table TEXT,
			created_at TIMESTAMP NOT NULL DEFAULT NOW(),
			UNIQUE(file_hash)
						);
						'';
		};
  udisks2.enable = true;

	};
  
programs = { 
  appimage.binfmt = true;
	adb.enable = true;
	bat.enable = true;
	direnv = {
		enable = true;
		loadInNixShell = true;
		enableZshIntegration = true;
		nix-direnv.enable = true;
	  	};
	git.enable = true;
	kdeconnect.enable = true;
	lazygit.enable = true;
	nh = {
   		enable = true;
  	 #  clean.enable = true;
     #  clean.extraArgs = "--keep-since 5d --keep 5";
  	 #  flake = "/home/t0psh31f/hydenix";
 		    };
	steam.enable = true;
	tmux.enable = true;
	thunderbird.enable = true;
	extra-container.enable = true;
	zoxide = {
		enable = true;
		enableZshIntegration = true;
	      };
      };

  users.users.t0psh31f = {
    isNormalUser = true; 
    initialPassword = "hydenix"; # Default password (CHANGE THIS after first login with passwd)
    extraGroups = [
      "wheel" 
      "networkmanager" 
      "video" 
      "aria2"
      "docker"
      "podman"
      "virtio"
	    "adbusers"
    ];
    shell = pkgs.zsh; 
  };

 # nix.gc = {
 #  automatic = true;
 #  dates = "weekly";
 #  options = "--delete-older-than 30d";
 #	};	

    # Enable common container config files in /etc/containers
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      dockerSocket.enable = true;
      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;
      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };


  system.stateVersion = "25.05";
}
