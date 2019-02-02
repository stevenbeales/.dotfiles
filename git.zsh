# Git Shortcuts
alias g='git'
alias st='git status'
alias com='git commit -m'
alias clone='git clone'
alias sth='git stash'
alias lg='git log'
alias u='git add -u'
alias all='git add .'
alias gbr="git remote prune origin && git branch -r"
alias gp='git push'
alias gpom='git push origin master'
alias gacp=git-add-commit-push
alias gsur='git submodule update --recursive'
alias gsurr='git submodule update --recursive --remote'
alias glm='git fetch origin master:master'
alias gr='git reset'
alias gcopyrev='git rev-parse HEAD | tr -d "\n" | pbcopy'
alias undopush="git push -f origin HEAD^:master"

# Use Git’s colored diff when available
hash git &>/dev/null;
if [ $? -eq 0 ]; then
	function diff() {
		git diff --no-index --color-words "$@";
	}
fi;

gpb() { git push -u origin "$(git rev-parse --abbrev-ref HEAD)" }

gig() { curl -L -s https://www.gitignore.io/api/$@ ;}

giga() { gig $@ >> .gitignore ;}

git-add-commit-push() {
  git add -A && git commit -m "$1" && git push
}

git_dirty() {
    if [ "${git_worktree_is_bare}" = 'false' ] && [ -n "$(git status --untracked-files='no' --porcelain)" ]; then
        git_dirty='%F{green}*'
    else
        unset git_dirty
    fi
}

git-forget() { 
  if [[ "$1" == "-f" ]]; then
    shift
    local FORCE_ARG="-f"
  else
    local FORCE_ARG=""
  fi
  local FILTER_EXP="git rm -r --cached --ignore-unmatch $*"
  git filter-branch $FORCE_ARG --index-filter "$FILTER_EXP" --prune-empty
}

gitize() { 
	git init && git add . && git commit -a -m"initial commit" && git gc
} 
# git commit browser. needs fzf
log() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --toggle-sort=\` \
      --bind "ctrl-m:execute:
                echo '{}' | grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R'"
}