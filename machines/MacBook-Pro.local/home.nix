# NCR workbook
{ config, ... }:
let
  # import raw sources to use github sources
  sources = import ../../nix/sources.nix;
  # import niv-managed pkgs overlay
  pkgs = import ../../nix { inherit sources; };
  jfrog = import ../../home/tools/jfrog-cli.nix { };
  berglas = import ../../home/tools/berglas.nix { };
in
{
  imports = [
    ../../nix/config
    ../../home
    ../../home/git/ncr
  ];

  programs.git.extraConfig = {
    # use my personal identity my person
    includeIf."gitdir:~/dev/" = {
      path = "~/.config/git/js";
    };
    # use work identity for work
    includeIf."gitdir:~/dev/ncr/" = {
      path = "~/.config/git/ncr";
    };
  };

  # workbook specific zsh config
  programs.zsh.shellGlobalAliases = {
    jf = "jfrog-cli";
  };
  programs.zsh.initExtra = ''
    # jira completions if jira CLI is installed 
    if [ command -v jira &> /dev/null ]; then
      eval "$(jira --completion-script-zsh)"
    fi
    # symlink bazelisk to ~/bin/bazel if it doesnt exist
    if [ ! -f ~/bin/bazel ]; then
      mkdir -p ~/bin
      ln -s "$(which bazelisk)" ~/bin/bazel
    fi
  '';

  # packages i only use at work
  home.packages = with pkgs;
    [
      jfrog
    ];
}
