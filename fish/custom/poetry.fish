# ls when entering new directory
function prm
    rm poetry.lock
    poetry env remove $(poetry env list | awk '{print $1}')
end
