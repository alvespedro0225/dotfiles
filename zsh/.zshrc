#starship shell
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"
#autocomplete
autoload -Uz compinit
compinit
#interface
zstyle ':completion:*' menu select

# pacman -S zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# pacman -S zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#open spotify from terminal without attaching it's process to the terminal
alias spotify='(nohup spotify > /dev/null 2>&1 &)'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias image='kitten icat'

# changes directory to yazi when leaving. Q not to.
function run_yazi {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

zle -N run_yazi

function run_tmux {
	tmux
}


#keybindings
bindkey "^[[3~" delete-char # delete
bindkey ";5D" backward-word # ctrl + 
bindkey ";5C" forward-word # ctrl + 
bindkey -r "^A" # unbind
bindkey "^A" kill-whole-line # ctrl + A
bindkey -r "^F" # unbind
bindkey "^F" run_yazi # -s binds a string and \n executes it. so this executes y command
bindkey -r "^T" # unbind
#add varables to PATH
export PATH="$PATH:/home/pedro/.dotnet/tools" #dotnet
export PATH="$PATH:/usr/bin/kitty" #kitty
export PATH="$PATH:/home/pedro/Emulation/Emulators/3DS/Borked" #3ds emu
#setup env varables
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark
export EDITOR=nvim
export TERM=ghostty
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
