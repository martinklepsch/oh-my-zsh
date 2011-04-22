function prompt_char {
	git branch >/dev/null 2>/dev/null && echo '±' && return
	hg root >/dev/null 2>/dev/null && echo '☿' && return
	echo '○'
}

function hostbat {
	bat=$(acpi | awk '{sub(/%/, ""); print $NF}')
	if   (( $bat >= 90 )); then
		echo "%{$fg[green]%}$(hostname)%{$reset_color%}"
	elif (( bat >= 30 )) ; then
		echo "%{$fg[yellow]%}$(hostname)%{$reset_color%}"
	else
		echo "%{$fg[red]%}$(hostname)%{$reset_color%}"
	fi
}

ZSH_THEME_GIT_PROMPT_PREFIX=" ♆ %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ☮"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}"

ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%} ◔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ◑%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ◕%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%} ⚡%{$reset_color%}"

PROMPT='%{$fg[magenta]%}%n%{$reset_color%} at $(hostbat) in %{$fg[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)$(git_prompt_status)
$(prompt_char) '
