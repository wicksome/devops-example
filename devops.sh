#!/bin/sh

stop() {
    (cd proxy && docker-compose down)
    (cd service && docker-compose down)
}

start() {
    # proxy
    if [ -n "$(cd proxy && docker-compose ps -q)" ]; then
        echo "proxy is running"
    else
        (cd proxy && docker-compose up -d)
    fi
    # service
    if [ -n "$(cd service && docker-compose ps -q)" ]; then
        echo "service is running"
    else
        (cd service && docker-compose up -d)
    fi
}

deploy() {
    (cd proxy && docker-compose down && docker-compose build --no-cache && docker-compose up -d)
    (cd service && docker-compose down && docker-compose build --no-cache && docker-compose up -d)
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