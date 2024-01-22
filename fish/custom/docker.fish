function dockerclean
    docker stop (docker ps -aq)
    docker rm (docker ps -aq)
    docker rmi (docker images -aq)
end

function ministart
    minikube start --driver=docker --container-runtime=containerd                                                             00:34:22
end
