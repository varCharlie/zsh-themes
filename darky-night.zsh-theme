#!/usr/bin/env zsh
local return_code="%(?..%{$FG[220]%}%? ↵%{$reset_color%}) "
local date="%t"
setopt promptsubst

autoload -U add-zsh-hook
#PROMPT_SUCCESS_COLOR=$FG[180]
#PROMPT_FAILURE_COLOR=$FG[190]
#PROMPT_VCS_INFO_COLOR=$FG[008]
#PROMPT_PROMPT=$FG[108]
GIT_DIRTY_COLOR=$FG[160]
GIT_CLEAN_COLOR=$FG[063]
GIT_PROMPT_INFO=$FG[210]

PROMPT='
%{$GIT_DIRTY_COLOR%}%# %{$reset_color%}%{$FG[202]%}{%n} %{$reset_color%}%{$FG[203]%}on %{$reset_color%}%{$FG[204]%}%m %{$reset_color%}%{$FG[205]%}in %{$reset_color%}%{$FG[206]%}%~ %{$reset_color%}%{$FG[220]%}$(git_prompt_info)%{$reset_color%}%{$GIT_DIRTY_COLOR%}$(git_prompt_status)%{$reset_color%}
%{$FG[248]%}❯❯ %{$reset_color%}'

RPS1="${return_code}${date}"

ZSH_THEME_GIT_PROMPT_PREFIX=" 
{git} => %{$FG[221]%}using%{$FG[222]%} branch%{$FG[223]%}  "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✔"

ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[191]%} ✚%{$rset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[191]%} ✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[191]%} ✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[191]%} ➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[191]%} ═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[191]%} ✭%{$reset_color%}"
