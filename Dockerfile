FROM prom/prometheus

# Copy the template and the entrypoint script into the image
COPY prometheus.yml.template /etc/prometheus/prometheus.yml.template
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# Set the entrypoint script
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

# Optionally, define a default command for Prometheus (if not already defined)
CMD ["--config.file=/etc/prometheus/prometheus.yml"]
