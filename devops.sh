#!/bin/sh

USER="service"

stop() {  # -c 옵션은 해당 USER로 실행함을 의미.
    # sudo su - $USER -c "# something to stop"
    docker stop web
}

start() {  
    docker run container
}

deploy() {
    start
}

case "$1" in  
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart) 
        stop
        start
        ;;
    deploy)
        deploy
        ;;
    *)
    echo "Usage: $0 {start | stop | restart | deploy}"
esac  