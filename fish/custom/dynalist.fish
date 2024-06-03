# function fo
#   v -c ":Telescope find_files"
#   # set file (fd --type file --follow --hidden --exclude .git | fzf --preview 'bat --color=always --line-range=:500 {}')
#   # if test "$file" != ''
#   #   rifle $file
#   # end
# end

function dyna
  cd ~/workspace/experiments/tasknalist
  rye run tasknalist
end

function dyna_mobile
  cd ~/workspace/experiments/tasknalist
  rye run fetch_mobile
end
