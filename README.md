# snell

# 构建 Docker 镜像
docker build -t snell-server .

# 运行 Docker 容器
docker run -d --name snell -p 25011:25011 snell-server
