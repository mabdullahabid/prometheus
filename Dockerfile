# Stage 1: Use an Alpine image to get envsubst
FROM alpine AS builder
RUN apk add --no-cache gettext

# Stage 2: Build your final image
FROM prom/prometheus

# Copy envsubst from the builder stage
COPY --from=builder /usr/bin/envsubst /usr/local/bin/envsubst

# Copy the Prometheus template and entrypoint script
COPY prometheus.yml.template /etc/prometheus/prometheus.yml.template
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Use our custom entrypoint
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

# Use default CMD (as provided by prom/prometheus, or override here)
CMD ["--config.file=/etc/prometheus/prometheus.yml"]
