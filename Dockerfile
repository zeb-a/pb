FROM debian:bookworm-slim

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y curl unzip ca-certificates && rm -rf /var/lib/apt/lists/*

# Download PocketBase binary
RUN curl -L https://github.com/pocketbase/pocketbase/releases/latest/download/pocketbase_linux_amd64.zip \
    -o pocketbase.zip \
    && unzip pocketbase.zip \
    && chmod +x pocketbase \
    && rm pocketbase.zip

# Expose Railway port
EXPOSE 8090

# Run PocketBase on Railway's port
CMD ["sh", "-c", "./pocketbase serve --http=0.0.0.0:${PORT:-8090}"]
