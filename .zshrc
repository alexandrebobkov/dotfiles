source ~/.utilcfg
source ~/.npmcfg
source ~/.dockercfg

unsetopt BG_NICE # Issue with WSL and nice

SAVEHIST=30
HISTFILE=~/.zsh_history

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable vcs root_indicator)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time)
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="\uE0C6 "
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=" \uE0C2"
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=" \uE0C3"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="  %{%F{blue}%}\uE0C5"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=" %{%F{249}%}\uF155~%{%F{green}%}\uF054%{%F{default}%} "
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_HOME_ICON='\uF015 '
POWERLEVEL9K_HOME_SUB_ICON='\uF015 '
POWERLEVEL9K_FOLDER_ICON='\uF07C '
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="white"
POWERLEVEL9K_LOCK_ICON='\uF023 '
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=' \uF09B'
POWERLEVEL9K_VCS_BRANCH_ICON='\uF126'
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=1
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='245'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='white'

zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
        chmod 755 -R ~/.zplug # Issue with permissions
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
