{ ... }:

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
        enable = true; # enable editors module
     #  neovim.enable = true; # enable neovim module
        vscode = {
          enable = true; # enable vscode module
          wallbash = true; # enable wallbash extension for vscode
        };
    #    vim.enable = false; # enable vim module
         default = "helix"; # default text editor
      };
      fastfetch.enable = true; # fastfetch configuration
      firefox = {
        enable = true; # enable firefox module
   #     useHydeConfig = true; # use hyde firefox configuration and extensions
   #     useUserChrome = true; # if useHydeConfig is true, apply hyde userChrome CSS customizations
   #     useUserJs = true; # if useHydeConfig is true, apply hyde user.js preferences
   #     useExtensions = true; # if useHydeConfig is true, install hyde firefox extensions
      };
      git = {
        enable = true; # enable git module
        name = "T0PSH31F"; # git user name eg "John Doe"
        email = "wrighterik77@gmail.com"; # git user email eg "john.doe@example.com"
      };
      hyde.enable = true; # enable hyde module
      hyprland.enable = true; # enable hyprland module
      lockscreen = {
        enable = true; # enable lockscreen module
        hyprlock = true; # enable hyprlock lockscreen
        swaylock = false; # enable swaylock lockscreen
      };
      notifications.enable = true; # enable notifications module
      qt.enable = true; # enable qt module
      rofi.enable = true; # enable rofi module
      screenshots = {
        enable = true; # enable screenshots module
        grim.enable = true; # enable grim screenshot tool
        slurp.enable = true; # enable slurp region selection tool
        satty.enable = true; # enable satty screenshot annotation tool
        swappy.enable = false; # enable swappy screenshot editor
      };
      shell = {
        enable = true; # enable shell module
        zsh.enable = true; # enable zsh shell
        zsh.configText = ""; # zsh config text
        bash.enable = false; # enable bash shell
        fish.enable = false; # enable fish shell
        pokego.enable = true; # enable Pokemon ASCII art scripts
      };
      social = {
        enable = true; # enable social module
        discord.enable = true; # enable discord module
        webcord.enable = true; # enable webcord module
        vesktop.enable = true; # enable vesktop module
      };
      spotify.enable = true; # enable spotify module
      swww.enable = true; # enable swww wallpaper daemon
      terminals = {
        enable = true; # enable terminals module
        kitty = {
          enable = true; # enable kitty terminal
          configText = ""; # kitty config text
        };
      };
      theme = {
        enable = true; # enable theme module
        active = "LimeFrenzy"; # active theme name
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
      waybar.enable = true; # enable waybar module
      wlogout.enable = true; # enable wlogout module
      xdg.enable = true; # enable xdg module
    
  };
}
