{
  pkgs,
  ...
}: {
 
  imports = [
    ./fish.nix
    ./fzf.nix
    ./neofetch.nix
  ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    extraOptions = [ "-l" "--icons" "--git" "-a" ];
  };

  programs.bat = {
    enable = true;
  };

  home.packages = with pkgs; [
    coreutils
    fd
    htop
    httpie
    jq
    procs
    ripgrep
    tldr
    zip
  ];

}
