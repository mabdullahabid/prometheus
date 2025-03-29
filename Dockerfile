FROM prom/prometheus

# Copy the configuration generator script into the image
COPY generate_config.sh /usr/local/bin/generate_config.sh

# Ensure the script is executable (if your Docker supports COPY --chmod, you could do that instead)
RUN chmod +x /usr/local/bin/generate_config.sh

# Set the script as the container entrypoint
ENTRYPOINT ["/usr/local/bin/generate_config.sh"]

# Use default Prometheus command-line options, if any
CMD ["--config.file=/etc/prometheus/prometheus.yml"]
