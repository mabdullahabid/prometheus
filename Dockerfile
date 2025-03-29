FROM prom/prometheus

# Define a build argument for the Hetzner bearer token
ARG HETZNER_BEARER_TOKEN

# Fail the build if HETZNER_BEARER_TOKEN is not provided
RUN test -n "$HETZNER_BEARER_TOKEN" || (echo "Error: HETZNER_BEARER_TOKEN is required" && exit 1)

# Copy the prometheus.yml file and replace the token placeholder
ADD prometheus.yml /etc/prometheus/prometheus.yml
RUN sed -i "s|HETZNER_BEARER_TOKEN|${HETZNER_BEARER_TOKEN}|g" /etc/prometheus/prometheus.yml