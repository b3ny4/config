{
  inputs,
  pkgs,
  ...
}:
{

  home.file.".config/zsh" = {
    source = ./zsh;
    recursive = true;
  };

  home.file.".zshrc" = {
    source = ./zsh/.zshrc;
  };

  home.packages = with pkgs; [];
}
