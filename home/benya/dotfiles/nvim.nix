{
  inputs,
  pkgs,
  ...
}:
{

  home.file.".config/nvim" = {
    source = ./nvim;
    recursive = true;
  };

  home.packages = with pkgs; [
    nodejs
    python3
  ];
}
