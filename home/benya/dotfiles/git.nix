{
  inputs,
  pkgs,
  ...
}:
{

  home.file.".gitconfig" = {
    source = ./git/.gitconfig;
  };

  home.packages = with pkgs; [];
}
