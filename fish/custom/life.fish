# Decrypts life folder from dropbox, and cd's into it
function life
  rm /tmp/life
  cd $HOME/Dropbox/documents
  gpg -d life.tar.gz.asc | tar zxv -C /tmp
  cd /tmp/life
end

function liferm
  rm /tmp/life
end

function lifebackup
  cd /tmp
  tar -cvz life | gpg -a -e -r (whoami) -o $HOME/Dropbox/documents/life.tar.gz.asc
end
