# EasyBot Docker

本项构建了能使用 EasyBot 的 Docker 镜像，支持图片渲染。本项目不包含easybot本体，也不包含napcat。只支持AMD64架构/平台，如果需要构建其他架构/平台的镜像，请 **Fork** 本项目，然后修改 ``.env`` 中的 ``IMAGE_ARCH`` 并在 **Action** 中运行 `Build and release Docker image` ，详细教程可以看 [DockerImageBuilder](https://github.com/decike/DockerImageBuilder) 。

## 使用方法

### 1. 准备工作

1. 访问仓库的 [Releases](https://github.com/decike/easybot-docker/releases) 页面，下载最新的 `easybot-docker-*.tar.gz` 文件，并加载到 Docker：
    ```bash
    # 下载tar.gz
    wget https://github.com/decike/easybot-docker/releases/download/v0.1.1/decike_easybot-docker_0.1.1-amd64.tar.gz -O decike_easybot-docker.tar.gz
    # 载入镜像
    docker load -i decike_easybot-docker.tar.gz
    # 删掉下载的临时文件
    rm -rf decike_easybot-docker.tar.gz
    ```
2. 下载最新版 EasyBot 解压(下面的链接可能不是最新的，需要你去👉[这里](https://files.inectar.cn/easybot/dev)👈找到linux版 **注意是linux版！** 并复制最新的下载地址到下面)
    ```bash
    # 新建一个easybot目录，这个目录就是日后存放easybot所有数据的地方
    mkdir easybot
    # 下载（这里需要改成最新的地址）
    wget https://files.inectar.cn/p/ftp/easybot/dev/2.0.0-dev.14/linux-x64/easybot-dev-linux-x64-2.0.0-dev.14.zip -O easybot.zip
    # 解压
    unzip easybot.zip -d easybot
    ```

### 2. 运行
让容器将容器内的 5000 和 26990 端口暴露到宿主机，并确保服务监听所有网卡（0.0.0.0）：
```bash
docker run -d \
  --name eazybot \
  -p 5000:5000 -p 26990:26990 \
  -v ./easybot:/app \
  -e TZ=Asia/Shanghai \
  --restart unless-stopped \
  decike/easybot-docker
```
### 3. 使用
使用就跟官方文档的一样了，可以去看看 👉[官方文档](https://docs.inectar.cn/docs/easybot/intor)👈