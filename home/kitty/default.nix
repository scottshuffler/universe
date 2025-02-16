{
  programs.kitty = {
    enable = true;
    settings = {
      # dont update unless its via nix
      update_check_interval = 0;

      # editor
      editor = "code --wait";

      # style
      tab_bar_margin_width = "5.0";
      tab_bar_style = "powerline";

      macos_thicken_font = "0.50";
      macos_show_window_title_in = "none";

      font_size = "16.0";

      # BELL DING DING DING
      enable_audio_bell = "no";

      # clicking links
      allow_hyperlinks = "yes";
      open_url_modifiers = "cmd";

      # scrollback
      scrollback_lines = 50000;

      # sessions
      startup_session = "sessions/default.conf";
    };
    keybindings = {
      # tabs
      "cmd+right" = "next_tab";
      "cmd+left" = "previous_tab";
      "cmd+w" = "close_tab";
      "cmd+1" = "goto_tab 1";
      "cmd+2" = "goto_tab 2";
      "cmd+3" = "goto_tab 3";
      "cmd+4" = "goto_tab 4";
      "cmd+5" = "goto_tab 5";
      "cmd+6" = "goto_tab 6";
      "cmd+l" = "goto_tab -1";

      # font sizes
      "cmd+equal" = "change_font_size current + 2.0";
      "cmd+shift+equal" = "change_font_size all + 2.0";
      "cmd+minus" = "change_font_size current - 2.0";
      "cmd+shift+minus" = "change_font_size all - 2.0";

      # TODO: setup scrollback_pager hotkeys
      # https://sw.kovidgoyal.net/kitty/#the-scrollback-buffer

      # reset terminal
      "cmd+r" = "clear_terminal reset active";
      "cmd+k" = "clear_terminal clear active";
      "ctrl+k" = "clear + terminale scroll active";
    };
    extraConfig = ''
      include themes/ayu_light.conf
    '';
  };
  # wire up static kitty assets not managed by home-manager/nix
  home.file.".config/kitty/themes" = {
    recursive = true;
    source = ./themes;
  };
  home.file.".config/kitty/sessions" = {
    recursive = true;
    source = ./sessions;
  };
}
