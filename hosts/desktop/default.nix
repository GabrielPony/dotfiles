{ pkgs, lib, ... }: 
{
  imports = [
    ./addon-configuration.nix
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  nix.nixPath = lib.mkForce ["/etc/nix/inputs"];
  powerManagement.cpuFreqGovernor = "performance";
}
