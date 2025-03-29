#!/bin/sh

# Default targets if not provided
DEFAULT_TARGETS="localhost:9100"

# Read targets from environment variable or use default
TARGETS=${PROMETHEUS_TARGETS:-$DEFAULT_TARGETS}

# Generate prometheus.yml
cat <<EOF > /etc/prometheus/prometheus.yml
global:
  scrape_interval: 15s

scrape_configs:
- job_name: node
  static_configs:
  - targets: [${TARGETS}]
EOF

# Start Prometheus
/bin/prometheus --config.file=/etc/prometheus/prometheus.yml