{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.users.benya = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.benya = 
    import ../../../home/benya/${config.networking.hostName}.nix;
}
