{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.users.benya = {
    isNormalUser = true;
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
      "wireshark"
    ];
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.benya = 
    import ../../../home/benya/${config.networking.hostName}.nix;
}
