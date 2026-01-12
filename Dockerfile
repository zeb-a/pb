# Use a lightweight Linux base
FROM alpine:latest

# Install required packages
RUN apk add --no-cache curl unzip bash

# Set working directory
WORKDIR /app

# Download PocketBase
RUN curl -L -o pocketbase.zip https://github.com/pocketbase/pocketbase/releases/latest/download/pocketbase_0.35.0_linux_amd64.zip \
    && unzip pocketbase.zip \
    && chmod +x pocketbase \
    && rm pocketbase.zip

# Expose the default port
EXPOSE 8090

# Start PocketBase
CMD ["./pocketbase", "serve", "--http", "0.0.0.0:8090"]
