# Dockerfile
ARG IMAGE_NAME="dockerimagebuilder"
ARG VERSION="0.0.1"
FROM mcr.microsoft.com/dotnet/aspnet:8.0

# 元信息（通过 build-arg 传入）
ARG VERSION
ARG IMAGE_NAME
ARG AUTHOR
LABEL maintainer="$AUTHOR"
LABEL org.opencontainers.image.version="$VERSION"
LABEL org.opencontainers.image.title="$IMAGE_NAME"

# 安装系统 & 图形 & Chromium 依赖
RUN apt-get update && apt-get install -y --no-install-recommends \
        libappindicator3-1 \
        libasound2 \
        libatk-bridge2.0-0 \
        libatk1.0-0 \
        libcairo2 \
        libcups2 \
        libdbus-1-3 \
        libexpat1 \
        libfontconfig1 \
        libgbm1 \
        libglib2.0-0 \
        libgtk-3-0 \
        libnspr4 \
        libnss3 \
        libpango-1.0-0 \
        libpangocairo-1.0-0 \
        libx11-6 \
        libx11-xcb1 \
        libxcb1 \
        libxcomposite1 \
        libxcursor1 \
        libxdamage1 \
        libxext6 \
        libxfixes3 \
        libxi6 \
        libxrandr2 \
        libxrender1 \
        libxss1 \
        libxtst6 \
        xdg-utils \
        xvfb \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# 把仓库 data 目录下的所有内容复制到 /app
COPY data/ .

# 确保脚本/文件可访问、可执行
RUN chmod -R a+rX /app || true

EXPOSE 5000 26990

# 默认运行 ./start（如果不存在将导致容器退出；可根据需要修改）
CMD ["./EasyBot"]
