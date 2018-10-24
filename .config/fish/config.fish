set -x EDITOR vim
set -x VISUAL vim

set fish_color_command    5fd75f
set fish_color_param    eeeeee
set fish_color_quote    ffff00
set fish_color_redirection    00d7ff
set fish_color_end      8700ff
set fish_color_error    cc6666
set fish_color_comment    ffd700
set fish_color_autosuggestion   969896

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
