{
  inputs,
  pkgs,
  ...
}:
{

  home.file.".config/rofi" = {
    source = ./rofi;
    recursive = true;
  };

  home.packages = with pkgs; [];
}
