## 构建镜像
docker build -t finleyma/express .

docker login

docker push finleyma/express

## 进入容器
docker run -it --rm finleyma/express:1.0 ash
