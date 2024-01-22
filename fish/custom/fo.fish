function fo
  set file (fd --type file --follow --hidden --exclude .git | fzf --preview 'bat --color=always --line-range=:500 {}')
  if test "$file" != ''
    if string match -q "*.tsx" $file
        nvim $file
    else if string match -q "*.md" $file
        nvim $file
    else
        rifle $file
    end
  end
end

function fk
  set file (find ~/.config -type f | fzf --preview 'bat --color=always --line-range=:500 {}')
  if test "$file" != ''
    nvim $file
  end
end

function Fd
#  set dir (find . -type d -not -path '*/.git*' -not -path '*/node_modules*' -not -path '.git'| fzf +m)
 set dir (fd -I -H -t d | sort -r | fzf)
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
