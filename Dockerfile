FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    coturn \
    && rm -rf /var/lib/apt/lists/*

# Generate a random secret at build time
ENV TURN_SECRET=ulendo_turn_secret_abc26_2026
ENV TURN_REALM=ulendo.app
ENV TURN_PORT=3478

COPY turnserver.conf /etc/turnserver.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 3478
EXPOSE 3478/udp
EXPOSE 5349
EXPOSE 5349/udp

CMD ["/start.sh"]
