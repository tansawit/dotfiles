# Vars
# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# PATH
export GOPATH="$(go env GOPATH)" # Go
export PATH="$PATH:$GOPATH/bin" # Go
export PATH=$PATH:/opt/anaconda3/bin
export PATH=${0:A:h}/bin:$PATH
export PATH=~/yugabyte/bin:$PATH

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sawittri/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/sawittri/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sawittri/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/sawittri/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
