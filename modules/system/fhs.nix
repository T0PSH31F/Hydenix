{ config. pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (buildFHSEnv {
      name = "fhs";
      targetPkgs = pkgs: with pkgs; [
        pkg-config
        ncurses
        glibc
        gcc
        zlib
        # Common runtime dependencies
        gtk2
        gtk3
        qt5.qtbase
        xorg.libX11
        xorg.libXcomposite
        xorg.libXcursor
        xorg.libXdamage
        xorg.libXext
        xorg.libXfixes
        xorg.libXi
        xorg.libXrandr
        xorg.libXrender
        xorg.libXtst
        xorg.libxcb
        nss
        nspr
        alsa-lib
        cups
        fontconfig
        gdk-pixbuf
        cairo
        pango
        libGL
        expat
        dbus
        xorg.libXScrnSaver
        libappindicator
        libnotify
        xdg-utils
        curl
      ];
      profile = "export FHS=1";
      runScript = "bash";
      extraOutputsToInstall = ["dev"];
    })
  ];
}