#!/bin/bash
# 每个应用都重新打包, 并发送到远程的阿里云镜像仓库

docker login --username=xinsheng.zxs@alibaba-inc.com --password=a8263099  registry.cn-hangzhou.aliyuncs.com

build_package() {
  echo $1
  cd ./$1
  mvn clean package -DskipTests
  cd ..
  docker build -t $1:1.0 ./$1
  docker tag $1:1.0 registry.cn-hangzhou.aliyuncs.com/xinsheng/$1:1.0
  docker push registry.cn-hangzhou.aliyuncs.com/xinsheng/$1:1.0
}

build_package 'account-service'
build_package 'auth-service'
build_package 'config'
build_package 'gateway'
build_package 'monitoring'
build_package 'notification-service'
build_package 'registry'
build_package 'statistics-service'
build_package 'turbine-stream-service'
