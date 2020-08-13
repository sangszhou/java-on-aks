# 每个应用都重新打包, 并发送到远程的阿里云镜像仓库

docker login --username=xinsheng.zxs@alibaba-inc.com --password=a8263099  registry.cn-hangzhou.aliyuncs.com

#account_service=./account_service

docker build -t account-service:1.0 ./account_service
docker tag account-service:1.0 registry.cn-hangzhou.aliyuncs.com/account-service:1.0

