# Decrypts life folder from dropbox, and cd's into it
function ytd
    set url (ytfzf -t)
    echo $url
    yt url $url
end
