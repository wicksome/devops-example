# devops example

![제목 없는 다이어그램 (1)](https://user-images.githubusercontent.com/5036939/56005289-9907eb80-5d0a-11e9-8b67-06d40d9e3ba5.png)


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

## 실행하기

```
git clone https://github.com/wicksome/devops-example.git
cd devops-example/

docker network create devops

./devops.sh start
./devops.sh stop
./devops.sh restart
./devops.sh deploy
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