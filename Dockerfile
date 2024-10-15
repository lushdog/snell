FROM ubuntu:22.04

# 安装 wget 和 unzip 工具
RUN apt-get update && apt-get install -y wget unzip

# 下载 Snell Server
RUN wget https://dl.nssurge.com/snell/snell-server-v4.1.1-linux-amd64.zip

# 解压 Snell Server 到 /usr/local/bin
RUN unzip snell-server-v4.1.1-linux-amd64.zip -d /usr/local/bin

# 清理不需要的文件
RUN rm snell-server-v4.1.1-linux-amd64.zip

# 复制配置文件到容器内
COPY snell-server.conf /etc/snell-server.conf

# 设置非特权用户运行服务
RUN groupadd -r snell && useradd -r -g snell snell
RUN chown snell:snell /usr/local/bin/snell-server

# 暴露端口
EXPOSE 25011

# 运行 Snell Server
CMD ["/usr/local/bin/snell-server", "-c", "/etc/snell-server.conf"]
