```bash
# build
$ docker build -t nginx-reverse-proxy-example:latest .

# run
$ docker run --name proxy-nginx -d -p 80:80 nginx-reverse-proxy-example
# run
$ docker run --rm -p 80:80 nginx-reverse-proxy-example
```
