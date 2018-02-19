### remove unnecessary Win PATHs
# This can prevent extension-less commands from bleeding into BASH.
# (eg. "ng" would execute the Win bin if "@angular/cli" wasn't installed on Linux.)
#
function path_remove {
  # Delete path by parts so we can never accidentally remove sub paths
  PATH=${PATH//":$1:"/":"} # delete any instances in the middle
  PATH=${PATH/#"$1:"/} # delete any instance at the beginning
  PATH=${PATH/%":$1"/} # delete any instance in the at the end
}
path_remove '/mnt/c/Users/me/AppData/Roaming/npm'
path_remove '/mnt/c/Users/me/AppData/Local/Yarn/bin'
path_remove '/mnt/c/Program Files (x86)/Yarn/bin'
path_remove '/mnt/c/Program Files/Git'
path_remove '/mnt/c/Program Files/Git/cmd'
path_remove '/mnt/c/Program Files/nodejs'
path_remove '/mnt/c/OpenSSL-Win32/bin'
path_remove '/mnt/c/Program Files (x86)/Python27'

NPM_PACKAGES="${HOME}/.npm-packages"

PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

export DOCKER_HOST=tcp://0.0.0.0:2375

unsetopt BG_NICE # Issue with WSL and nice

SAVEHIST=30
HISTFILE=~/.zsh_history

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"

zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

chmod 755 -R ~/.zplug # Issue with permissions

# Then, source plugins and add commands to $PATH
zplug load

alias ls=colorls
alias config='/usr/bin/git --git-dir=/home/dougmaitelli/.cfg/ --work-tree=/home/dougmaitelli'
