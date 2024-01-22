# alias gpg="gpg2 --homedir $HOME/.config/gnupg"
alias gpg="gpg2"

# Import gpg keys
function gimport
	gpg --import $HOME/.config/gnupg/public.gpg

	cp $HOME/.config/gnupg/secret.gpg.cpt /tmp
	ccrypt -d /tmp/secret.gpg
	gpg --import /tmp/secret.gpg
  rm /tmp/secret.gpg

  gpg --edit-key (whoami)
end

# Export gpg keys
function gexp
	gpg --output $HOME/.config/gnupg/public.gpg --armor --export $argv
	gpg --output $HOME/.config/gnupg/secret.gpg --armor --export-secret-key $argv

	ccrypt $HOME/.config/gnupg/secret.gpg
end

# Create a backup of the current folder, then encrypt with gpg key
function gbackup
  set -l d (date +%s)
  tar --exclude-from=.gitignore -cvz $argv[1] | gpg -a -e -r (whoami) -o $d.taz.gpg
end

# ENcrypt and DEcrypt
function gencrypt
  gpg -a -e -r (whoami) -o $argv.gpg $argv
end
function gdecrypt
  set file (echo otp_accounts.json.gpg | sed 's/\.gpg//g')
  gpg -d -o $file $argv
end
