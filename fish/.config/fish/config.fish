if status is-login
    if not set -q __sourced_profile
        set -x __sourced_profile 1
        exec bash -c "\
            test -e /etc/profile && source /etc/profile
            test -e $HOME/.bash_profile && source $HOME/.bash_profile
            exec fish --login
        "
    end

    set -e __sourced_profile
end

if status is-interactive
    bind ctrl-f __yazi repaint

    # Load starship
    starship init fish | source

    alias ls="ls --color=auto"
    alias grep="rg"
    alias image="kitten icat"
    alias sudo="sudo-rs"
    alias zed="zeditor"
    alias find="fd"
	set __ZO_FZF_OPTS 1
	set __ZO_RESOLVE_SYMLINKS 1
	zoxide init fish --cmd=cd | source 
end
