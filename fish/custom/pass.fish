# function ppi
#   diceware -s 5 -n 6 | xclip -selection c
#   pass insert $argv
# end
#
# function pp
#   set Query (ls ~/.password-store/ | cut -d '.' -f 1 | fzf)
#   pass -c $Query
#   pass $Query
# end
#
# function ppe
#   set Query (ls ~/.password-store/ | cut -d '.' -f 1 | fzf)
#   pass edit $Query
# end

function genpass
  set Pass (diceware -n 4)
  echo $Pass
  echo $Pass | win32yank.exe -i
end
