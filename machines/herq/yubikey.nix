{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    yubikey-personalization
    yubikey-personalization-gui
    yubioath-desktop
    yubico-pam
  ];

  security.pam.yubico = {
    enable = true;
    debug = true;
    mode = "challenge-response";
  };
}
