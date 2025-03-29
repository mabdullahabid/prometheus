FROM prom/prometheus

# Define a build argument for the Hetzner bearer token
ARG HETZNER_BEARER_TOKEN

# Copy the prometheus.yml file and replace the token placeholder
ADD prometheus.yml /etc/prometheus/prometheus.yml
RUN sed -i "s|HETZNER_BEARER_TOKEN|${HETZNER_BEARER_TOKEN}|g" /etc/prometheus/prometheus.yml