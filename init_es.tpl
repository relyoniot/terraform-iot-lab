#!/bin/bash
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
sudo apt-get update && sudo apt-get install -y elasticsearch openjdk-8-jre-headless

cat <<'EOF' >/etc/elasticsearch/elasticsearch.yml
network.host: [_global_, _local_]
cluster.name: es_cluster
discovery.zen.ping.unicast.hosts: ["172.0.10.3", "172.0.10.4", "172.0.10.5", "172.0.10.6", "172.0.10.7", "172.0.10.8", "172.0.10.9", "172.0.10.10", "172.0.10.11", "172.0.10.12", "172.0.10.13", "172.0.10.14", "172.0.10.15", "172.0.10.16", "172.0.10.17"]
bootstrap.mlockall: true
EOF
echo "elasticsearch soft memlock unlimited" >> /etc/security/limits.conf
echo "elasticsearch hard memlock unlimited" >> /etc/security/limits.conf
echo "MAX_LOCKED_MEMORY=unlimited" >> /etc/default/elasticsearch
echo "ES_HEAP_SIZE=8g" >> /etc/default/elasticsearch
sudo systemctl enable elasticsearch
sudo systemctl start elasticsearch
