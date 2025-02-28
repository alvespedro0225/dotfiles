#starship shell
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"
#autocomplete
autoload -Uz compinit
compinit
#interface
zstyle ':completion:*' menu select


#autocomplete and syntax highlight
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#open spotify from terminal without attaching it's process to the terminal
alias spotify='(nohup spotify > /dev/null 2>&1 &)'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias image='kitten icat'

#keybinding
bindkey "^[[3~" delete-char #delete
bindkey ";5D" backward-word #ctrl + 
bindkey ";5C" forward-word #ctrl + 
bindkey "^V" kill-line

#add varables to PATH
export PATH="$PATH:~/.dotnet/tools" #dotnet
export PATH="$PATH:/usr/bin/kitty" #kitty

#SSH agent auto-start
# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#     ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
# fi
# if [ ! -f "$SSH_AUTH_SOCK" ]; then
#     source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
# fi

#setup env varables
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark


#open rider from terminal without attaching it's process to the terminal
#function so that it can receive files to open
rider()
{
    (nohup ~/.local/share/JetBrains/Toolbox/apps/rider/bin/rider "$@" > /dev/null 2>&1 &)
}

#open godot from terminal without attaching it's process to the terminal
#function so that it can receive files to open
godot()
{
    (nohup godot-mono "$@" > /dev/null 2>&1 &)
}

#open webstorm from terminal without attaching it's process to the terminal
#function so that it can receive files to open
webstorm()
{
    (nohup ~/.local/share/JetBrains/Toolbox/apps/webstorm/bin/webstorm "$@" > /dev/null 2>&1 &)
}