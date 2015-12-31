#!/usr/bin/env zsh
# Local variables
local return_code="%(?..%{$FG[220]%}%? ↵%{$reset_color%}) "
local date="%t"

# options and hooks
setopt promptsubst
autoload -U add-zsh-hook

# git mod color
GIT_MOD_COLOR="%{$FG[252]%}"

#----------------------------------------------
# Output:
#----------------------------------------------
#  % charlespantoga on mac-chapan in ~
#  ❯❯ ...typing here...
#----------------------------------------------
PROMPT='
%{$FG[160]%}%# %{$FG[202]%}%n %{$reset_color%}%{$FG[203]%}on %{$reset_color%}%{$FG[204]%}%m %{$reset_color%}%{$FG[205]%}in %{$reset_color%}%{$FG[176]%}%~ %{$reset_color%}%{$FG[220]%}$(git_prompt_info)%{$reset_color%}%{$FG[160]%}$(git_prompt_status)%{$reset_color%}
%{$FG[248]%}❯❯ %{$reset_color%}'
RPS1="${return_code}${date}"

ZSH_THEME_GIT_PROMPT_PREFIX=" 
/git/ %{$FG[221]%}using%{$FG[222]%} branch%{$FG[223]%}  "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[031]%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$FG[160]%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$FG[063]%}✔"

ZSH_THEME_GIT_PROMPT_ADDED="%{$GIT_MOD_COLOR%} ✚%{$rset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$GIT_MOD_COLOR%} ✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$GIT_MOD_COLOR%} ✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$GIT_MOD_COLOR%} ➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$GIT_MOD_COLOR%} ═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$GIT_MOD_COLOR%} ✭%{$reset_color%}"
