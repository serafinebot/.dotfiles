PROMPT='%n %{${fg_bold[red]}%}:: %{${fg[green]}%}%2~%(0?. . %{${fg[red]}%}%? )$(git_prompt_info)%{${fg[blue]}%}»%{${reset_color}%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}(%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[cyan]%}*%{$fg[green]%}) %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}) "
