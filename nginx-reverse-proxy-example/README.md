```bash
# build
$ docker build -t wicksome/nginx-reverse-proxy-example:latest .

# run
$ docker run --name proxy-nginx -d -p 80:80 --net=host nginx-reverse-proxy-example

# run(test)
$ docker run --rm -p 8888:80 wicksome/nginx-reverse-proxy-example
```
