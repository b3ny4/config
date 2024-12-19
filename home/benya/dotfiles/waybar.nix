{
  inputs,
  pkgs,
  ...
}:
{

  home.file.".config/waybar" = {
    source = ./waybar;
    recursive = true;
  };

  home.packages = with pkgs; [];
}
