{ pkgs, ... }:
{  
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        amdvlk 
      ];
      extraPackages32 = with pkgs; [ 
        driversi686Linux.amdvlk 
      ];
    };
  };
  hardware.enableRedistributableFirmware = true;
}
