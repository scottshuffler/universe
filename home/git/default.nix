{ pkgs, ... }:
{
  programs.git = with pkgs; {
    package = git;

    enable = true;

    userName = "scott shuffler";
    # override for individual file paths for some machines (e.g., work)
    userEmail = "scottshuffler@gmail.com";

    extraConfig = {
      # credentials helper
      credential = {
        # use system-installed on nixOS; dont support any other OS
        helper =
          if stdenv.isLinux then
            "${pkgs.gitAndTools.pass-git-helper}/bin/pass-git-helper" else
            "osxkeychain";
        useHttpPath = true;
      };

      # pull 
      pull = {
        rebase = "false";
      };
    };
  };

  home.packages = with pkgs; [
    gitAndTools.git-crypt
  ];
}
