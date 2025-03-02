format = """
[░▒▓](a)\
[  ](bg:a fg:b)\
[](bg:c fg:a)\
$directory\
[](fg:c bg:)\
$git_branch\
$git_status\
[](fg bg)\
$nodejs\
$rust\
$golang\
$php\
[](fg )\
$time\
[ ](fg)\
\n$character"""

[palettes.tokyo_night]

a = #a3aed2
b = #090c0c
c = #769ff0
d = #212736
e = #1d2230
f = #e3e5e5
g = #394260
h = #a0a9cb

[directory]
style = "fg: bg:c"
format = "[ $path ]($style)"
truncation_length = 3
truncation_symbol = "…/"

[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = " "
"Pictures" = " "

[git_branch]
symbol = ""
style = "bg
format = '[[ $symbol $branch ](fg:c bg:)]($style)'

[git_status]
style = "bg
format = '[[($all_status$ahead_behind )](fg:c bg)]($style)'

[nodejs]
symbol = ""
style = "bg"
format = 
[rust]
symbol = ""
style = "bg
format = '[[ $symbol ($version) ](fg: bg:)]($style)'

[golang]
symbol = ""
style = "bg"
format = '[[ $symbol ($version) ](fg: bg)]($style)'

[php]
symbol = ""
style = "bg
format = '[[ $symbol ($version) ](fg: bg:)]($style)'

[time]
disabled = false
time_format = "%R" # Hour:Minute Format
style = "b"
format = '[[  $time ](fg: bg:)]($style)'
