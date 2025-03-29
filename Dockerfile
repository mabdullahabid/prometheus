FROM prom/prometheus

# Add the script to generate prometheus.yml
ADD generate_config.sh /usr/local/bin/generate_config.sh
RUN chmod +x /usr/local/bin/generate_config.sh

# Set the entrypoint to the script
ENTRYPOINT ["/usr/local/bin/generate_config.sh"]