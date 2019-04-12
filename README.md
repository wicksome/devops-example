# devops example

## 요구사항

- [x] 웹 애플리케이션: spring-boot-sample-web-ui
  - [x] build: gradle
  - [x] 독립적인 container로 구성: `docker pull wicksome/spring-boot-gradle-example`
  - [x] log는 host에 file로 적재: spring log path - `/tmp/logs`
  - [x] health check API 추가: `GET /health`
    - [x] response type: json - `{ "status": "UP" }`
- [x] 웹서버 nginx
- [x] reverse proxy 80 port, round robin 방식 - `haproxy`
- [x] 실행스크립트 개발언어: `bash`
- [ ] container scale in/out
- [ ] 무중단 배포 동작 구현


## 사전 작업

```bash
docker network create devops
```

## 실행하기

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
