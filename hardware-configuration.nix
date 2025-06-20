# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/dd2efb00-f32f-4afb-a857-60232694fe38";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-6a94c28f-2839-4131-935b-a1b69327c918".device = "/dev/disk/by-uuid/6a94c28f-2839-4131-935b-a1b69327c918";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/AD6C-8133";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  # Enable zram-based swap (compressed swap in RAM)
  zramSwap = {
    enable = true;
    # Optional: set the percentage of RAM to use for zram swap (default is 50)
     memoryPercent = 33;
  };

  # Enable a 32GB encrypted swap file
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 32 * 1024; # Size in MB (32GB)
      randomEncryption.enable = true;
      priority = -1;
    }
  ];

  # networking.useDHCP = lib.mkDefault true;
  networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}