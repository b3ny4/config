{
  inputs,
  pkgs,
  ...
}:
{

  home.file.".ssh/config" = {
    source = ./ssh/config;
  };

  home.packages = with pkgs; [];
}
