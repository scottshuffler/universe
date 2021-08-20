{ pkgs, ... }:
{
  services.sxhkd = {
    enable = true;
    keybindings = {
      "super + c" = "xdotool key --delay 0 --clearmodifiers ctrl+c";
    };
  };
}
