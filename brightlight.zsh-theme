#!/usr/bin/env zsh
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%}) "
local date="%t"
setopt promptsubst

autoload -U add-zsh-hook
ROOT_ICON_COLOR=$FG[060]
MACHINE_NAME_COLOR=$FG[204]
PROMPT_90=$FG[089]
PROMPT_91=$FG[090]
PROMPT_92=$FG[091]
PROMPT_93=$FG[092]
PROMPT_94=$FG[093]
#PROMPT_SUCCESS_COLOR=$FG[026]
PROMPT_FAILURE_COLOR=$FG[190]
PROMPT_VCS_INFO_COLOR=$FG[242]
PROMPT_PROMPT=$FG[238]
GIT_DIRTY_COLOR=$FG[196]
GIT_CLEAN_COLOR=$FG[069]
GIT_PROMPT_INFO=$FG[031]
#GIT_PROMPT_INFO=$FG[018]

# Hash
ROOT_ICON="# "
if [[ $EUID -ne 0 ]] ; then
    ROOT_ICON=""
fi


PROMPT='
%{$PROMPT_90%}$ROOT_ICON%{$reset_color%}%{$reset_color%}%{$PROMPT_90%}%n %{$reset_color%}%{$PROMPT_91%}on%{$reset_color%}%{$PROMPT_92%} %M %{$reset_color%}%{$PROMPT_93%}in%{$reset_color%}%{$PROMPT_94%} %.%{$reset_color%}%{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status) %{$reset_color%}'
PROMPT+='
%{$PROMPT_PROMPT%}❯❯ %{$reset_color%}'

RPS1="${return_code}${date}"

# Git prompt
ZSH_THEME_GIT_PROMPT_PREFIX=" { git: "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%}}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✘ "
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✔ "

ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[067]%} ✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[067]%} ✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[067]%} ✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[067]%} ➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[067]%} ═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[067]%} ✭%{$reset_color%}"
