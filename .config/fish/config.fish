set -x EDITOR vim
set -x VISUAL vim
set -x BROWSER /usr/bin/chromium

set fish_color_command        78BD65
set fish_color_param          EEEEEE
set fish_color_quote          E5CD52
set fish_color_redirection    4FB3D8
set fish_color_end            C678DD
set fish_color_error          EB3D54
set fish_color_comment        686B78
set fish_color_autosuggestion 888A85

set fish_color_selection --bacground=2F3137
set fish_color_search_match --background=2F3137

set -g theme_color_scheme dark
set -g theme_nerd_fonts yes
set -g theme_display_date no
set -g theme_newline_cursor clean

alias config "/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

if type -q hub
  alias git "hub"
end

if type -q exa
  alias ls "exa"
end

if type -q docker
  alias docklear "docker ps -q --filter 'status=exited' --filter 'status=created' | xargs docker rm"
end

set -x NPM_PACKAGES $HOME/.npm-packages
set -x PATH $NPM_PACKAGES/bin $PATH
set -x MANPATH $NPM_PACKAGES/share/man (manpath)

[ -e $HOME/.env ]; and source $HOME/.env
