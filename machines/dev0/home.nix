# NCR workbook
{ config, ... }:
let
  # import raw sources to use github sources
  sources = import ../../nix/sources.nix;
  # import niv-managed pkgs overlay
  pkgs = import ../../nix { inherit sources; };
in
{
  imports = [
    ../../nix/config
    ../../home
    ../../home/git
    ../../home/git/ncr
  ];
}
