set -x EDITOR vim
set -x VISUAL vim
set -x BROWSER /usr/bin/firefox

if type -q firefox-developer-edition
  set -x BROWSER /usr/bin/firefox-developer-edition
end

set fish_color_command        78BD65
set fish_color_param          eeeeee
set fish_color_quote          ffff00
set fish_color_redirection    4FB3D8
set fish_color_end            C678DD
set fish_color_error          BF4040
set fish_color_comment        EF7C2A
set fish_color_autosuggestion 888A85

set fish_color_selection --bacground=green
set fish_color_search_match --background=green

set -g theme_nerd_fonts yes
set -g theme_display_date no
set -g theme_newline_cursor yes

alias config "/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

if type -q hub
  alias git "hub"
end
if type -q exa
  alias ls "exa"
end

set -x NPM_PACKAGES $HOME/.npm-packages
set -x PATH $NPM_PACKAGES/bin $PATH
set -x MANPATH $NPM_PACKAGES/share/man (manpath)

set -l ppid (cat /proc/(echo %self)/status | grep PPid | cut -f2)
if string match -r 'tilix' (ps --no-headers -p $ppid -o comm) 1> /dev/null
    for wid in (xdotool search --pid $ppid)
        xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid
    end
end
