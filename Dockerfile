# Use the official Caddy image
FROM caddy:2-alpine

# Copy the Caddyfile into the container
COPY Caddyfile /etc/caddy/Caddyfile

# Expose ports 80 and 443
EXPOSE 80 443

# Default command (inherited from base image)
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile"]