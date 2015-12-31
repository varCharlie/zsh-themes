#!/usr/bin/env zsh
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%}) "
local date="%t"
setopt promptsubst

autoload -U add-zsh-hook
ROOT_ICON_COLOR=$FG[060]
MACHINE_NAME_COLOR=$FG[208]
PROMPT_SUCCESS_COLOR=$FG[024]
PROMPT_FAILURE_COLOR=$FG[124]
PROMPT_VCS_INFO_COLOR=$FG[242]
PROMPT_PROMPT=$FG[238]
GIT_DIRTY_COLOR=$FG[009]
GIT_CLEAN_COLOR=$FG[069]
GIT_PROMPT_INFO=$FG[060]

# Hash
ROOT_ICON="# "
if [[ $EUID -ne 0 ]] ; then
    ROOT_ICON=""
fi

PROMPT='
%{$ROOT_ICON_COLOR%}$ROOT_ICON%{$reset_color%}%{$reset_color%}%{$PROMPT_SUCCESS_COLOR%}%n in %.%{$reset_color%}%{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status) %{$reset_color%}
%{$PROMPT_PROMPT%}❯❯ %{$reset_color%}'

RPS1="${return_code}${date}"

ZSH_THEME_GIT_PROMPT_PREFIX=" git: "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✔"

ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[052]%} ✚%{$rset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[052]%} ✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[052]%} ✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[052]%} ➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[052]%} ═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[052]%} ✭%{$reset_color%}"
