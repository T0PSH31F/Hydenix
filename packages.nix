{ pkgs, config, inputs, ... }:{


home.packages = with pkgs; [
 # Python Development
 # (python3Full.withPackages (ps: with ps; [
 #       virtualenv 
 #       pip
 #       numpy
 #       pandas
 #       langchain
 #     ]))
    # python3
    # python313
    # python313Packages.firecrawl-py
    # python313Packages.langchain-huggingface
    # python313Packages.langchain-text-splitters
    # python313Packages.langfuse
    # python313Packages.langgraph-checkpoint
    # python313Packages.langgraph-checkpoint-postgres
    # python313Packages.langgraph-checkpoint-sqlite
    # python313Packages.langgraph-cli
    # python313Packages.langgraph-prebuilt
    # python313Packages.langgraph-sdk
    # python313Packages.langsmith
    # python313Packages.llama-cloud
    # python313Packages.llamaindex-py-client
    # python313Packages.llm-gemini
    # python313Packages.numpy
    # python313Packages.pandas
    # python313Packages.pip
    # python313Packages.psycopg2
    # python313Packages.python-docx
    # python313Packages.python-magic
    # python313Packages.sentence-transformers
    # python313Packages.sqlalchemy
    # python313Packages.virtualenv
    # python313Packages.watchdog
    poetry
    uv
    migrate-to-uv

# AI/ML Tools

    aichat
    chatmcp
    cherry-studio
    fabric-ai
    # goose-cli
    gpt4all
    jan
    langgraph-cli
    librechat
    local-ai
    lmstudio
    open-webui
    mistral-rs
    mcphost
    n8n
    #task-master-ai
    pinokio
    watson

# Database Clients

    csview
    pgcli
    tidy-viewer # - CSV pretty printer
    visidata

# Document/Office Tools

    calibre
    jot
    koreader
    libreoffice-fresh
    librum
    lunacy 
  # nb
    zathura

# Terminal/CLI Tools

    anakron
    amazon-q-cli
    bluez
    bluetuith
  #  broot
    bun
  #  corepack
    deadnix
  #  dvtm
  #  dum
    era
    fzf
    gh
    glow
  #  gifski
  #  gifsicle
  #  gif-for-cli
    gobble
  #  golem
  #  gomapenum
  #  go-dork
  #  gospider
  #  gotree
    graphicsmagick
    gpgme
    gum
    gurk-rs # Signal messaenger TUI
    irssi
    jq
    kubectl
    #kubectl-ai
    kubecolor
    notcurses
    nrr # - Minimal, blazing fast npm scripts runner
    ov # - Feature-rich terminal-based text viewer
    peep # - CLI text viewer tool that works like less command on small pane within the terminal window
    peek # - Simple animated GIF screen recorder with an easy to use interface
    pom # - Pomodoro Timer
    ragenix
    ripgrep-all
    scli # - Signal terminal user interface
    silver-searcher
    slack-term
    sshs
    statix
    suckit
  #  tarts
    tealdeer
    television
    tg
  #  tsukimi
  #  yuhaiin
    zellij
    
# Dev Toyz

    blahaj
    cava
    cbonsai
    clolcat
    cfonts
    cowsay
    figlet
    gtk-engine-murrine
    lavat
    neo
    terminaltexteffects
    ternimal
    themechanger
    toilet

# Emulators

   # cool-retro-term
    ghostty
    tmux
    warp-terminal

# IDE/Text Editors

    code-cursor
    gedit
    jetbrains.idea-ultimate
    helix
    # kakoune
    micro
    nano 
    # sublime
    vscode-fhs
    windsurf
    zed-editor

# File Management

    eza
    lsd
    lf
    superfile
    xplorer
    yazi

# Graphics/Media

   # adl
    aria2
    ariang
  #  cantata
    caprine
    catimg
    elegant-sddm
    feh
  #  hakuneko
    media-downloader
    miru
    mpv
    mpd
    timg
    uget
    vlc

# Browsers

    brave
  #  firefox
  #  shadowfox
    qutebrowser
    tor-browser
   # vivaldi

    # Desktop Apps

    bitwarden-desktop
    caprine
    calibre
    cinny-desktop
    frostwire-bin
    github-desktop
   # keepassxc
    kodi-wayland
    kotatogram-desktop
    lutris
    obsidian
    qalculate-gtk
    quickgui
    quickemu
    retroarch-full
    ripcord
   # rustdesk
    signal-desktop
    steam-run
    pods
   # wasistlos

# Miscellaneous
    
   onthespot
 ];
}
