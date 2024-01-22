function showZkNotes
  set FZF_DEFAULT_COMMAND "zk list -q --format=jsonl | jq  -c --raw-output '[.filename, .title] | @tsv'"
  fzf --delimiter='\t' --with-nth=2 --preview 'bat --color=always --line-range=:500 {1}' --bind "ctrl-x:execute(rm {1})+reload($FZF_DEFAULT_COMMAND)"
end

## Private garden
function zkp
  cd "/home/alpha/writing/second_brain/private_garden"
  set a (showZkNotes | awk '{print $1}')
  nvim $a
end

## Public garden
function zkd
  cd "/home/alpha/writing/second_brain/pub.digitalgarden"
  set a (showZkNotes | awk '{print $1}')
  nvim $a
end

function zkrm
  set FZF_DEFAULT_COMMAND "zk list -q --format=jsonl | jq  -c --raw-output '[.filename, .title] | @tsv'"
  fzf --delimiter='\t' --with-nth=2 --preview 'bat --color=always --style==numbers --line-range=:500 {1}' --bind "ctrl-x:execute(rm {1})+reload($FZF_DEFAULT_COMMAND)"
end

alias zki="nvim '/home/alpha/writing/second_brain/private_garden/gtd_index.md'"
alias zkl="zkrm"
