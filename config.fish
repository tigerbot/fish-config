set -U __fish_git_prompt_show_informative_status 1
set -U __fish_git_prompt_showuntrackedfiles 1

set -U __fish_git_prompt_color_branch "magenta"
set -U __fish_git_prompt_showupstream "informative"
set -U __fish_git_prompt_char_upstream_ahead  "↑"
set -U __fish_git_prompt_char_upstream_behind "↓"
set -U __fish_git_prompt_char_upstream_prefix ""

set -U __fish_git_prompt_char_stagedstate     "+"
set -U __fish_git_prompt_char_dirtystate      "*"
set -U __fish_git_prompt_char_untrackedfiles  "…"
set -U __fish_git_prompt_char_conflictedstate "✖"
set -U __fish_git_prompt_char_cleanstate      "✔"

set -U __fish_git_prompt_color_stagedstate    "green"
set -U __fish_git_prompt_color_dirtystate     "yellow"
set -U __fish_git_prompt_color_untrackedfiles "888"
set -U __fish_git_prompt_color_invalidstate   "red"
set -U __fish_git_prompt_color_cleanstate     -o green

set -U fish_color_user '7AF'
set -U fish_color_host 'cyan'
set -U fish_color_cwd  'green'
#set -U fish_color_cwd  '9EA'

set -xg GREP_COLOR '1;30'
setup-env
