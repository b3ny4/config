{
  inputs,
  pkgs,
  ...
}:
{

  home.file.".config/hypr" = {
    source = ./hypr;
    recursive = true;
  };

  home.packages = with pkgs; [];
}
