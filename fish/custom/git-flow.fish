alias gffs="git flow feature start"
alias gfrs="git flow release start"
alias gfrf="git flow release finish"

function gfff -d "Git flow feature finish"
  # set branch (git branch | grep \* | cut -d ' ' -f2)
  # git flow feature finish $branch
  git flow feature finish
end

function gco -d "Fuzzy-find and checkout a branch"
  git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
end

function gcoc -d "Fuzzy-find and checkout a commit"
  git log --pretty=oneline --abbrev-commit --reverse | fzf --tac +s -e | awk '{print $1;}' | read -l result; and git checkout "$result"
end
