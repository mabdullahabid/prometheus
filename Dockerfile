FROM prom/prometheus

# Switch to root to modify permissions
USER root

# Add the script to generate prometheus.yml
COPY generate_config.sh /usr/local/bin/generate_config.sh
RUN chmod +x /usr/local/bin/generate_config.sh

# Switch back to the default user
USER nobody

# Set the entrypoint to the script
ENTRYPOINT ["/usr/local/bin/generate_config.sh"]