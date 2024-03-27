# ls when entering new directory
function __do_ls --on-variable PWD
  if status --is-interactive
    exa --group-directories-first -L=1 -ahT
    # basename $PWD | cut -d '.' -f2 > /tmp/QT_Project_Name
  end
end
