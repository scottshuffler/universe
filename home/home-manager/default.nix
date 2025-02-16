{ pkgs, ... }:
{
  # either we are in OSX and I am using home-manager without sudo, or 
  # we are in nixOS and the requirement on sudo for nixos-rebuild switch 
  # makes the value of $USER incorrect.  I use scott across all non-work boxes
  home.username = if pkgs.stdenv.isDarwin then builtins.getEnv "USER" else "scott";
  home.homeDirectory = if pkgs.stdenv.isDarwin then builtins.getEnv "HOME" else "/home/scott";
  home.stateVersion = "20.09";

  programs.home-manager.enable = true;
}
