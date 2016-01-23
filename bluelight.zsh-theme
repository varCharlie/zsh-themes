#!/usr/bin/env zsh
# Local variables
local return_code="%(?..%{$FG[220]%}%? ↵%{$reset_color%}) "
local date="%t"

# options and hooks
setopt promptsubst
autoload -U add-zsh-hook

#=-----------------------------------------------------------------------------
#=> Colors ------------------------------------------------------------------=>
#=-----------------------------------------------------------------------------
# SYMBOLS
ROOTSYM=$FG[081]
LINESYM=$ROOTSYM
at0=$FG[154]
at1=$FG[155]
at2=$FG[156]
at3=$FG[157]
at4=$FG[158]
at5=$FG[159]
# GIT SYMS
GIT_MOD_COLOR=$ROOTSYM
at13=$FG[122]
at12=$FG[121]
at11=$FG[120]
at10=$FG[119]
at9=$FG[118]
#----------------------------------------------
# Output:
#----------------------------------------------
#  % charlespantoga on mac-chapan in ~
#  ❯❯ ...typing here...
#----------------------------------------------
PROMPT='
%{$ROOTSYM%}%# %{$at0%}%n %{$reset_color%}%{$at1%}on %{$reset_color%}%{$at2%}%m %{$reset_color%}%{$at3%}in %{$reset_color%}%{$at4%}%~ %{$reset_color%}%{$at5%}$(git_prompt_info)%{$reset_color%}%{$ROOTSYM%}$(git_prompt_status)%{$reset_color%}
%{$LINESYM%}❯❯ %{$reset_color%}'
RPS1="${return_code}${date}"

ZSH_THEME_GIT_PROMPT_PREFIX=" 
%{$ROOTSYM%}∫ %{$at9%}‹git› %{$at10%}using%{$at11%} branch%{$at12%}  "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[031]%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$FG[160]%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$FG[063]%}✔"

ZSH_THEME_GIT_PROMPT_ADDED="%{$GIT_MOD_COLOR%} ✚%{$rset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$GIT_MOD_COLOR%} ✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$GIT_MOD_COLOR%} ✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$GIT_MOD_COLOR%} ➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$GIT_MOD_COLOR%} ═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$GIT_MOD_COLOR%} ✭%{$reset_color%}"
