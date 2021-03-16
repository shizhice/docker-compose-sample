# RabbitMQ 集群 安装方式

### 一键安装
```shell
$ ./install.sh
```

### 手动安装

```shell
# 1. 安装RabbitMQ Cluster
$ docker-compose up -d
# 2. 初始化集群
#   2.1 初始化 rabbmitmq1
docker exec -it rabbitmq1 /bin/bash /home/rabbitmq.sh
#   2.2 初始化 rabbmitmq2
docker exec -it rabbitmq2 /bin/bash /home/rabbitmq.sh
#   2.3 初始化 rabbmitmq3
docker exec -it rabbitmq3 /bin/bash /home/rabbitmq.sh
# 3. 开启镜像队列
docker exec -it rabbitmq1 rabbitmqctl set_policy ha-all "^" '{"ha-mode":"all","ha-sync-mode":"automatic"}'
```

### RabbitMQ 服务及相关端口

|  主机   | Web 管理界面  | AMQP 端口|
|  ----  | ----  | ----  |
| rabbitmq1  | http://localhost:15672 | 5672  |
| rabbitmq2  | http://localhost:15682 | 5682  |
| rabbitmq3  | http://localhost:15692 | 5692  |