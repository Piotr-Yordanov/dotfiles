function shvv
    set current_dir (pwd)
    set remote_host (cd $HOME/workspace/cultivating-alpha/vultr; poetry run python main.py)
    cd $current_dir
    ssh root@$remote_host
end

function vvrn
    set current_dir (pwd)
    set remote_host (cd $HOME/workspace/cultivating-alpha/vultr; poetry run python main.py)
    cd $current_dir
    vncviewer -passwd ~/workspace/rocket-bot/MT5-Docker/assets/vnc/passwd $remote_host:5900

end

function vrn
    nohup remmina -c "vnc://ec2-18-188-187-12.us-east-2.compute.amazonaws.com?VncPassword=8M7DDd0NRcw8W+kUPOBSXg==" </dev/null >/dev/null 2>&1 &
end
function shv
    ssh -i "/home/alpha/workspace/rocket-bot/MT5-Docker/new_server_creation/main.pem" arch@ec2-18-188-187-12.us-east-2.compute.amazonaws.com
end

function shv2
    ssh -i "/home/alpha/workspace/rocket-bot/MT5-Docker/new_server_creation/main.pem" arch@ec2-18-223-124-27.us-east-2.compute.amazonaws.com
end
function vrn2
    vncviewer -passwd ~/workspace/rocket-bot/MT5-Docker/new_server_creation/assets/.vnc/passwd ec2-18-223-124-27.us-east-2.compute.amazonaws.com:5900
end

function shv3
    ssh -i "/home/alpha/workspace/rocket-bot/MT5-Docker/new_server_creation/main.pem" arch@ec2-18-117-229-169.us-east-2.compute.amazonaws.com
end
function vrn3
    # vncviewer -passwd ~/workspace/rocket-bot/MT5-Docker/new_server_creation/assets/.vnc/passwd ec2-18-117-229-169.us-east-2.compute.amazonaws.com:5900
    nohup remmina -c "vnc://ec2-18-117-229-169.us-east-2.compute.amazonaws.com?VncPassword=8M7DDd0NRcw8W+kUPOBSXg==" </dev/null >/dev/null 2>&1 &
end
