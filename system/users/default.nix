{ pkgs, ... }:
{
  users.mutableUsers = false;

  users.users.shimmerjs = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "libvirtd" ]; # Enable ‘sudo’ for the user.
    home = "/home/shimmerjs";
    shell = pkgs.zsh;
    hashedPassword = "$6$iyNCZ3nMZ421n4P$6U0svcZ0lrjp4HhcZYbzTBPyOWwZREPVHzPCL7j5LMrfVDggsOiqHC/YkHf5r/d5fEVWH4Q0RZT4P/dggapog";
  };

  users.users.scott = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ]; # Enable ‘sudo’ for the user.
    home = "/home/scott";
    shell = pkgs.zsh;
  };

  users.users.david = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ]; # Enable ‘sudo’ for the user.
    home = "/home/david";
    shell = pkgs.zsh;
  };
}
