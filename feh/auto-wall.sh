
#!/usr/bin/bash
img=(`find $HOME/.config/feh -name '*' -exec file {} \; | grep -o -P '^.+: \w+ image' | cut -d':' -f1`)
while true
do
   feh --bg-fill "${img[$RANDOM % ${#img[@]} ]}"
sleep 1
done
