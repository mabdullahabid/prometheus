FROM prom/prometheus

# Copy the configuration generator script with executable permissions
COPY --chmod=+x generate_config.sh /usr/local/bin/generate_config.sh

ENTRYPOINT ["/usr/local/bin/generate_config.sh"]
CMD ["--config.file=/etc/prometheus/prometheus.yml"]
