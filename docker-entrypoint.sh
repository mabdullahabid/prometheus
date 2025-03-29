#!/bin/sh
# Substitute environment variables in the Prometheus config template
envsubst < /etc/prometheus/prometheus.yml.template > /etc/prometheus/prometheus.yml

# Execute the original command (Prometheus)
exec "$@"
