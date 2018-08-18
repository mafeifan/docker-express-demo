FROM node:10.8.0-alpine
MAINTAINER mafeifan@qq.com
# 将根目录下的文件都copy到container（运行此镜像的容器）文件系统的app文件夹下
ADD . /app/
# 设置工作目录，下面的RUN命令会在工作目录执行
WORKDIR /app
# 安装项目依赖包
RUN npm install
EXPOSE 3000
# 容器启动时执行的命令，类似npm run start
CMD ["npm", "start"]