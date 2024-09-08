{ pkgs, inputs, nixpkgs, self, username, host, ... }: 
{
  networking = {
    interfaces.eno1.ipv4.addresses = [{
      address = "192.168.7.59";
      prefixLength = 24;
    }];
  };

  home-manager.users.${username} = {
    wayland.windowManager.hyprland.settings.monitor = [
        "DP-3, 3840x2160@60,     0x0, 1"
        "DP-2, 1920x1080@239.99, 3840x0, 1"
    ];
  };
  
  boot.kernelModules = [ "kvm-intel" ];
}
