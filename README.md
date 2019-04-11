# devops example

## 사전 작업

```bash
docker network create devops
```

# 실행하기

```
devops.sh start
devops.sh stop
devops.sh restart
devops.sh deploy
```

# 활용방안

1. `/service` 는 각 vm 서버에 실행한다.
    ```
    docker-compose build --no-cache
    docker-compose run -d
    ```
2. proxy 서버의 `haproxy.cfc` 에 vm 서버를 추가한다.
    ```
    ...
    backend server
        ...
        # load balancing
        balance roundrobin
        ...
        server springboot01 <vm_server_id>:<port> check
    ```

# 기타 참고 스크립트

```
dkc down && dkc build --no-cache && dkc up -d
apt-get update && apt-get install -y net-tools && apt-get install -y iputils-ping
```
