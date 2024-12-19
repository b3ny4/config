{
  inputs,
  pkgs,
  ...
}:
{

  home.file.".config/kitty" = {
    source = ./kitty;
    recursive = true;
  };

  home.packages = with pkgs; [];
}
