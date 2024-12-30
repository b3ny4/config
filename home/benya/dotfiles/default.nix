{
  inputs,
  pkgs,
  ...
}:
{

  imports = [
    ./bat.nix
	./git.nix
    ./hypr.nix
    ./kitty.nix
    ./nvim.nix
    ./rofi.nix
    ./waybar.nix
    ./zsh.nix
 ];

}
