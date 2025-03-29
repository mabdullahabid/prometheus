#!/bin/sh
set -e

# Generate the Prometheus configuration file using environment variable expansion
cat > /etc/prometheus/prometheus.yml <<EOF
scrape_configs:
  - job_name: "hetzner_service_discovery"
    hetzner_sd_configs:
      - role: "hcloud"
        bearer_token: "${HETZNER_BEARER_TOKEN}"
        port: 9100
EOF

# Execute Prometheus with any additional command-line arguments passed to the container
exec /bin/prometheus "$@"
