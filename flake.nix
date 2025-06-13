{
  description = "T0PSH31F's Hydenix Hyprland config";

  inputs = {
    # User's nixpkgs - for user packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-search-tv.url = "github:3timeslazy/nix-search-tv";

    nixos-facter-modules.url = "github:numtide/nixos-facter-modules";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
       };

    lobster.url = "github:justchokingaround/lobster";

    zen-browser.url = "github:MarceColl/zen-browser-flake";
   
    hydenix.url = "github:richen604/hydenix";
  };

  outputs =
     { zen-browser, lobster, nix-search-tv, ... }@inputs:
    let
      HOSTNAME = "Chopper";

      hydenixConfig = inputs.hydenix.inputs.hydenix-nixpkgs.lib.nixosSystem {
        inherit (inputs.hydenix.lib) system;
        specialArgs = {
          inherit inputs;
        };
        modules = [
         {
		environment.systemPackages = [
      zen-browser.packages.x86_64-linux.default
      nix-search-tv.packages.x86_64-linux.default
      inputs.lobster.packages.x86_64-linux.lobster
			];
		}
          ./configuration.nix
          inputs.nixos-facter-modules.nixosModules.facter
          { config.facter.reportPath = ./facter.json; }
        ];
      };

    in
    {
      nixosConfigurations.nixos = hydenixConfig;
      nixosConfigurations.${HOSTNAME} = hydenixConfig;
    };
}
