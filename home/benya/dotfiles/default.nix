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
    ./ssh.nix
    ./waybar.nix
    ./zsh.nix
 ];

}
