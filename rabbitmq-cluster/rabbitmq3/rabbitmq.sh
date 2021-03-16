rabbitmqctl stop_app
rabbitmqctl reset
# 设置为内存节点
rabbitmqctl join_cluster --ram rabbit@rabbitmq1
rabbitmqctl start_app