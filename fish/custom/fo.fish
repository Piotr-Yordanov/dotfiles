# function fo
#   v -c ":Telescope find_files"
#   # set file (fd --type file --follow --hidden --exclude .git | fzf --preview 'bat --color=always --line-range=:500 {}')
#   # if test "$file" != ''
#   #   rifle $file
#   # end
# end

function fo
 # Check if project.toml exists in the current directory
 if test -e ./pyproject.toml
    rye run ~/.local/bin/lvim -c ":Telescope find_files"
 else
    v -c ":Telescope find_files"
 end
end

function fk
  v -c "cd ~/.config | Telescope find_files"
  # set file (find ~/.config -type f | fzf --preview 'bat --color=always --line-range=:500 {}')
  # if test "$file" != ''
  #   rifle $file
  # end
end

function Fd
#  set dir (find . -type d -not -path '*/.git*' -not -path '*/node_modules*' -not -path '.git'| fzf +m)
 set dir (fd -H -t d | sort -r | fzf)
 if test "$dir" != ''
   cd $dir
 end
end

function fp --description 'Search your $PATH'
  set -l loc (echo $PATH | tr ' ' '\n' | eval "fzf $FZF_DEFAULT_OPTS --header='[find:path]'")

  if test (count $loc) = 1
    set -l cmd (rg --files -L $loc | rev | cut -d'/' -f1 | rev | tr ' ' '\n' | eval "fzf $FZF_DEFAULT_OPTS --header='[find:exe] => $loc'")
    if test (count $cmd) = 1
      echo $cmd
    else
      fp
    end
  end
end

function fz
  set file (find ~/warehouse/vimwiki -type f | fzf --preview 'bat --color=always --line-range=:500 {}')
  if test "$file" != ''
    if string match -q "*.tsx" $file
        nvim $file
    else
        rifle $file
    end
  end
end
