{ config, pkgs, ... }:

{
  imports = [
     ./packages.nix
  ];

  # hydenix home-manager options go here
  hydenix.hm = {
     enable = true;
      comma.enable = true; # useful nix tool to run software without installing it first
      dolphin.enable = true; # file manager
      editors = {
        enable = true;
     #  neovim.enable = true;
        vscode = {
          enable = true; 
          wallbash = true; # enable wallbash extension for vscode
        };
    #    vim.enable = false;
         default = "hx"; # default text editor
      };
      fastfetch.enable = true;
      firefox = {
        enable = true; 
   #     useHydeConfig = true; # use hyde firefox configuration and extensions
   #     useUserChrome = true; # if useHydeConfig is true, apply hyde userChrome CSS customizations
   #     useUserJs = true; # if useHydeConfig is true, apply hyde user.js preferences
   #     useExtensions = true; # if useHydeConfig is true, install hyde firefox extensions
      };
      git = {
        enable = true; 
        name = "T0PSH31F"; 
        email = "wrighterik77@gmail.com"; 
      };
      hyde.enable = true; # enable hyde module
      hyprland.enable = true; 
      lockscreen = {
        enable = true; 
        hyprlock = false; 
        swaylock = true; 
      };
      notifications.enable = true; 
      qt.enable = true; 
      rofi.enable = true; 
      screenshots = {
        enable = true; # enable screenshots module
        grim.enable = true; # enable grim screenshot tool
        slurp.enable = true; # enable slurp region selection tool
        satty.enable = true; # enable satty screenshot annotation tool
        swappy.enable = false; # enable swappy screenshot editor
      };
      shell = {
        enable = true; 
        zsh.enable = true; 
        zsh.configText = ""; 
        bash.enable = false; 
        fish.enable = false; 
        pokego.enable = true; 
      };
      social = {
        enable = true; 
        discord.enable = true; 
        webcord.enable = true; 
        vesktop.enable = true; 
      };
      spotify.enable = true; 
      swww.enable = true; 
      terminals = {
        enable = true; 
        kitty = {
          enable = true; 
          configText = ""; # kitty config text
        };
      };
      theme = {
        enable = true; 
        active = "LimeFrenzy"; 
        themes = [
           "AbyssGreen"
           "Abyssal-Wave"
           "Another-World"
           "Bad-Blood"
           "Catppuccin Mocha"
           "Cat-Latte"
           "Code-Garden" 
           "Crimson-Blade"
           "Decay-Green"
           # "DoomBringers"
           "Dracula"
           "Edge-Runner"
           "Graphite-Mono"
           "Grukai"
           "Gruvbox-Retro"
           "LimeFrenzy"
           "Monokai"
           "Nightbrew"
           "One-Dark"
           "Oxo-Carbon"
           "Paranoid-Sweet"
           "Piece-Of-Mind"
           "Pixel-Dream"
           "Rain-Dark"
           "Red-Stone"
           "Rose-Pine"
           "Scarlet-Night"
           "Sci-fi"
           "Solarized-Dark"
           "Synth-Wave"
           "Vanta-Black"
        ]; # default enabled themes, full list in https://github.com/richen604/hydenix/tree/main/hydenix/sources/themes
      };
      waybar.enable = true; 
      wlogout.enable = true; 
      xdg.enable = true; 
     
    
  };
}
