#!/bin/bash
# task context list |  awk '{print $1}'  |tail -n +4 | grep -v -e 'computer' -e 'home' -e 'client' -e 'next' -e 'inbox' -e "write" -e "+" | fzf | xargs -I {} task context {}
task context list |  awk '{print $1}'  |tail -n +4 | grep -v  -e "write" -e "+" | fzf | xargs -I {} task context {}
