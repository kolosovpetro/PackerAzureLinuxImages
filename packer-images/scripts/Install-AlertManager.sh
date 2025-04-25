#!/bin/bash

VERSION="0.28.1"
DEFAULT_ALERT_MANAGER_CONFIG_PATH="/etc/alertmanager/alertmanager.yml"
DEFAULT_ALERT_MANAGER_STORAGE_PATH="/var/lib/alertmanager"

cd /opt || exit

sudo wget "https://github.com/prometheus/alertmanager/releases/download/v$VERSION/alertmanager-$VERSION.linux-386.tar.gz"
sudo tar -xvf "alertmanager-$VERSION.linux-386.tar.gz"

cd "alertmanager-$VERSION.linux-386" || exit
sudo mv alertmanager /usr/local/bin/
sudo mv amtool /usr/local/bin/

sudo bash -c "cat > $DEFAULT_ALERT_MANAGER_CONFIG_PATH" <<EOF
global:
  scrape_interval: 15s
  evaluation_interval: 15s

# Alertmanager configuration
alerting:
  alertmanagers:
    - static_configs:
        - targets:
            - 'prometheus-master.razumovsky.me:9093'

scrape_configs:
  - job_name: 'node_exporter'
    static_configs:
      - targets:
        - 'linux-target.razumovsky.me:9100'
        - 'windows-target.razumovsky.me:9182'

rule_files:
  - "cpu_rules.yml"
  - "instance_shutdown_rules.yml"
  - "memory_rules.yml"
  - "storage_rules.yml"
EOF

sudo mkdir -p $DEFAULT_ALERT_MANAGER_STORAGE_PATH
