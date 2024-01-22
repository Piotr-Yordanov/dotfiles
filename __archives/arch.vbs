Set shell = CreateObject("WScript.Shell" )
' shell.Run "wsl.exe --shutdown", 0
' shell.Run "wsl.exe -d Arch -u alpha -- sh ~/.config/wsl.sh", 0
' shell.Run "wsl.exe -d Arch -- sh /home/alpha/.config/mount.sh", 0, True


shell.Run """C:\Program Files\VcXsrv\vcxsrv.exe"" :0 -screen 0 @1 -ac +xinerama -engine 1 -nodecoration -wgl"
WScript.Sleep 200
shell.Run "wsl.exe -d Arch -u alpha -- sh ~/.config/wsl.sh", 0
