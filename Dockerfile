FROM prom/prometheus

# Copy the configuration generator script into the image
COPY generate_config.sh /bin/generate_config.sh

# Ensure the script is executable (if your Docker supports COPY --chmod, you could do that instead)
RUN chmod +x /bin/generate_config.sh

# Set the script as the container entrypoint
ENTRYPOINT ["/bin/generate_config.sh"]

# Use default Prometheus command-line options, if any
CMD ["--config.file=/etc/prometheus/prometheus.yml"]
