if status is-interactive
	# Move to directory when leaving yazi
	function y
		set tmp (mktemp -t "yazi-cwd.XXXXXX")
		yazi $argv --cwd-file="$tmp"
		if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
				builtin cd -- "$cwd"
		end
		rm -f -- "$tmp"
	end

    # binds yazi to ctrl+ f and updates the cwd on the prompt
	bind ctrl-f 'y' repaint

	# Load starship
    starship init fish | source

    alias ls="ls --color=auto"
    alias grep="rg"
    alias image="kitten icat"
    alias sudo="sudo-rs"

end
