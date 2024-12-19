{
  inputs,
  pkgs,
  ...
}:
{

  imports = [
    ./bat.nix
    ./kitty.nix
    ./nvim.nix
    ./rofi.nix
    ./waybar.nix
    ./zsh.nix
 ];

}
