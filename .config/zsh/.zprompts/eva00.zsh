# Set required options.
#setopt PROMPT_SUBST
#autoload -U colors && colors # Enable colors

right_arrow(){
   echo $'\ue0b0'
}

left_arrow(){
   echo $'\ue0b2'
}
arrow_start() {
   echo "%K{$ARROW_BG}%F{$ARROW_FG}%B"
   #echo "%{$FG[$ARROW_FG]%}%{$BG[$ARROW_BG]%}%B"
}

arrow_start_git() {
   ARROW_FG="233"
   ARROW_BG="234"
   echo "%K{$ARROW_BG}%F{$ARROW_FG}"
   #echo "%{$FG[$ARROW_FG]%}%{$BG[$ARROW_BG]%}%B"
}

arrow_end() {
   echo "%b%f%k%K{$NEXT_ARROW_BG}%F{$NEXT_ARROW_FG}%B$(right_arrow)%b%f%k"
#   echo "%b%f%k%{$FG[$NEXT_ARROW_FG]%}%{$BG[$NEXT_ARROW_BG]%}$(right_arrow)%{$reset_color%}"
}

arrow_final() {
   echo "%b%f%k%F{$NEXT_ARROW_FG}%B$(right_arrow)%b%f"
}

os_icon(){
   SEGMENT_FG="009"
   SEGMENT_BG="233"
   NEXT_ARROW_BG="234"
   NEXT_ARROW_FG="233"
   echo "%K{$SEGMENT_BG}%F{$SEGMENT_FG} \ue77d %k%f$(arrow_end)"
}

ok_username() {
   ARROW_FG="233"
   ARROW_BG="234"
   SEGMENT_FG="green"
   SEGMENT_BG="234"
   NEXT_ARROW_BG="091"
   NEXT_ARROW_FG="234"
   echo "$(arrow_start)%K{$SEGMENT_BG}%F{$SEGMENT_FG} %n %k%f$(arrow_end)"
}

hostname() {
   ARROW_FG="233"
   ARROW_BG="234"
   SEGMENT_FG="green"
   SEGMENT_BG="091"
   NEXT_ARROW_BG="015"
   NEXT_ARROW_FG="091"
   echo "$(arrow_start)%K{$SEGMENT_BG}%F{$SEGMENT_FG} %m %k%f$(arrow_end)"
}

err_username() {
   ARROW_FG="016"
   ARROW_BG="160"
   NEXT_ARROW_BG="183"
   NEXT_ARROW_FG="160"
   echo "$(arrow_start) %n $(arrow_end)"
}

directory() {
   ARROW_FG="015"
   ARROW_BG="015"
   SEGMENT_FG="239"   
   SEGMENT_BG="015"   
   NEXT_ARROW_BG="157"
   NEXT_ARROW_FG="015"
   echo "$(arrow_start)%K{$SEGMENT_BG}%F{$SEGMENT_FG} %2~ %k%f$(arrow_end)"
}

# return err_username if there are errors, ok_username otherwise
username() {
   echo "$(ok_username)"
}

command_status(){
  echo "%(?.%F{green}✔%f.%F{009}✘%f)"
}

version_status() {
#   echo "\$vcs_info_msg_0_ "
   ARROW_FG="157"
   ARROW_BG="157"
   SEGMENT_FG="239"   
   SEGMENT_BG="015" 
   NEXT_ARROW_BG="000"
   NEXT_ARROW_FG="157"
   echo "$(arrow_start)\$vcs_info_msg_0_$(arrow_final)"
}

git_change() {
   echo $'\uf044'
}

git_branch() {
   echo $'\ue725'
}

zstyle ':vcs_info:*' unstagedstr "$(git_change) *1"
zstyle ':vcs_info:*' stagedstr "$(git_change) +1"
zstyle ':vcs_info:*' formats "$(arrow_start_git)%K{157}%F{239} $(git_branch) %b %F{197}%m%u%c%f %k%f"
zstyle ':vcs_info:*' actionformats "(%b|%a%u%c)"

PROMPT="$(os_icon)$(username)$(hostname)$(directory)$(version_status) "
RPROMPT="%F{232}%f%B%K{232} $(command_status) %k%b%K{232}%F{15}%f%k%K{15}%F{239} %* %f%k"


#PROMPT="%K{233}%F{9}  %f%k%K{234}%F{233} %f%k%K{234}%F{9}%n %f%k%K{238}%F{234} %f%k%B%K{238}%F{9}%m %f%k%b%K{white}%F{238}%f%k%B%K{white}%F{239} %~ %f%k%b%F{white}%f "
#RPROMPT="%F{15}%f%K{15}%F{239} %* %f%k"
