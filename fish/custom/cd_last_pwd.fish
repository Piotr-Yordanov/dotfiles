function cd_last_pwd
  if test -f /tmp/lastpwd
    set -l lastpwdpath (cat /tmp/lastpwd)
    if test $lastpwdpath != ''
      cd $lastpwdpath
    end
  end
end

# Save working dir
function writepwd --on-variable PWD
  pwd > /tmp/lastpwd
end

cd_last_pwd
