#! /bin/sh
# defined func ResetRabbitmqNode
function ResetRabbitmqNode() {
    echo "初始化 rabbitmq$1 node.";
    count=`docker exec -it rabbitmq$1 rabbitmqctl status | grep PID  |grep -v "grep" |wc -l`
    # 如不检查rabbitmq服务是否启动，初始化可能会失败
    while ((count == 0))
    do
        echo "rabbitmq$1 服务尚未启动，将在1s后尝试初始化，请稍后..."
        sleep 1;
        count=`docker exec -it rabbitmq$1 rabbitmqctl status | grep PID  |grep -v "grep" |wc -l`
    done
    docker exec -it rabbitmq$1 /bin/bash /home/rabbitmq.sh
}

up=`docker-compose top | wc -l`
if (($up != 0))
then
    echo "该app 已启动，如需继续执行，请执行 docker-compose down 后再试";
    exit
fi
# docker-compose
docker-compose up -d
# 初始化集群
# 初始化 rabbmitmq1
ResetRabbitmqNode 1
# 初始化 rabbmitmq2
ResetRabbitmqNode 2
# 初始化 rabbmitmq3
ResetRabbitmqNode 3