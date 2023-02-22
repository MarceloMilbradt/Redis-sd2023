# Use an official Redis image as a parent image
FROM redis:latest

# Expose Redis default port
EXPOSE 6379

# Run Redis as a non-root user
USER redis

# Set the working directory
WORKDIR /data

# Start Redis server
CMD [ "redis-server" ]