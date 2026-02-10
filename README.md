# DockerImageBuilder

此仓库为一个 GitHub Actions 模板，用来：

1. 从仓库的 `data/` 目录构建 Docker 镜像（所有 `data` 下的文件都会被复制到镜像的 `/app`）
2. 把构建出的镜像导出为 `.tar.gz` 并上传到 GitHub Release

## 使用步骤

1. 将本仓库模板复制到你的仓库
2. 根据 `.env.template` 创建根目录下的 `.env` 并填写 `IMAGE_NAME` 与 `IMAGE_TAG`
3. 把你要包含进镜像的所有文件放到 `data/`
4. 提交并推送到 GitHub，到 **Actions** 面板手动触发 `Build and release Docker image` 工作流
5. 完成后，在仓库 **Releases** 页面会看到新建的 release，内含镜像 `.tar.gz` 文件

## 注意事项

- 请确保 `BUILD_CONTEXT` 包含 `data/`（默认 `.` 即仓库根）
- 如果 `data/` 包含大量或大体积文件，会增加构建时间和生成的 tar 大小
- 运行容器时不要把宿主目录挂载到 `/app`（否则会覆盖镜像内的文件）
