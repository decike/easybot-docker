# Dockerfile
ARG IMAGE_NAME="dockerimagebuilder"
ARG VERSION="0.0.1"
FROM python:3.11-slim

# 元信息（通过 build-arg 传入）
ARG VERSION
ARG IMAGE_NAME
ARG AUTHOR
LABEL maintainer="$AUTHOR"
LABEL org.opencontainers.image.version="$VERSION"
LABEL org.opencontainers.image.title="$IMAGE_NAME"

WORKDIR /app

# 把仓库 data 目录下的所有内容复制到 /app
COPY data/ .

# 确保脚本/文件可访问、可执行
RUN chmod -R a+rX /app || true

# 默认运行 ./start（如果不存在将导致容器退出；可根据需要修改）
CMD ["./start"]
