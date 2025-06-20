{ config, pkgs,  ... }:
{

  imports = [
    #./fhs.nix
  ];

  environment.systemPackages = with pkgs; [

# Database Tools
    agorakit
    postgresql_15
    postgresql15Packages.lantern

# Network/Audit Tools

    aircrack-ng
    airgeddon
    # audiness # CLI for nessus
    # armitage
    # boofuzz
    burpsuite
    # cdk-go
    # cloudbrute
    # cloudfox
    # crackql
    # deepsea
    dsniff
    # dnschef
    # evil-winrm
    exegol # fully featured hacking environment
    exploitdb
    ffuf
    fuzzdb
    # ghauri
    # gitjacker
    # githound
    # gophish
    # go-exploitdb
    # ghost # android remote post-exploitation framework
    # h8mail
    kanha # webapp pentest suite
    metasploit
    # mongoaudit
    # msfpc
    netexec
    nikto
    nmap
    # octosuite
    # pwntools
    puncia # enrichment framework
    theharvester
    tshark
    # reptor
    # routersploit
    payloadsallthethings
    # pentestgpt
    # powersploit
    sn0int
    social-engineer-toolkit
    sploitscan
    subfinder
    websploit
    wfuzz
    wireshark
    zap
    zenmap

# Mobile Device Tools

    checkra1n
    idevicerestore
    ideviceinstaller
    ifuse
    libideviceactivation
    libirecovery
    libimobiledevice
    libimobiledevice-glue
    mvt  # -Tool to facilitate the consensual forensic analysis of Android and iOS devices
    usbmuxd
    usbmuxd2

# Container/DevOps Tools

    dive
    docker
    nil
    nixfmt-tree
    nix-init
    nix-zsh-completions
    node2nix
    nixos-anywhere
    nixos-container
    nixos-shell
    nix-serve-ng
    pods
    podman
    podman-compose
    podman-desktop
    podman-tui

# Fonts
    
    cfs-zen-tweaks
    creep
    font-awesome
    fontconfig
    font-manager
    openttd-ttf
    komika-fonts
    pixel-code
    zpix-pixel-font

# System Utilities

    adbfs-rootless
    android-tools
    apfs-fuse
    bc 
    # dmidecode
    cifs-utils
    coreutils 
    # curlftpfs
    diffutils
   # enum4linux
    exiftool
    exiflooter
    file
    findutils
    ff2mpv-rust
    ffmpeg-full
    ffmpegthumbnailer
   # fuse 
   # fuseiso 
    encfs  
   # ghostscript
    gnupg
   # google-drive-ocamlfuse
    heimdall 
    heimdall-gui
    imagemagick
    kdePackages.konsole
   # libcdio 
   # lynx 
   # mailutils
    mc   
   # mkvtoolnix
    mtpfs
    jmtpfs
    mlocate 
    nettools 
    ocs-url
    pdftk 
    pdfchain
   # poppler
   # poppler-utils 
    procps 
    psmisc 
   # pv 
   # recode 
    samba4Full
    smbnetfs 
    shared-mime-info 
    sirikali
    socat
    sox 
    sshfs
    tdl
    toybox
    unixbench
    util-linux 
    xdg-utils 
    xterm 
    wsdd
    # youtube-dl 
     

# Monitoring

    batmon
    bottom
    btop
    gotop
    gkrellm
   # iftop 
   # netop
   # ntopng
    nix-top
    nix-output-monitor
   # powertop
   # zfxtop

# Compression Algo's

    kdePackages.ark
    bzip2
    commonsCompress
    file-roller
    gnutar
    libarchive
    libunarr
    p7zip
    p7zip-rar
    unar
    xarchiver
    zip

  ];
}
