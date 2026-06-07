#!/bin/bash
# Replace env vars in config
sed -i "s|\${TURN_SECRET}|${TURN_SECRET}|g" /etc/turnserver.conf
sed -i "s|\${TURN_REALM}|${TURN_REALM}|g" /etc/turnserver.conf
sed -i "s|\${TURN_PORT}|${TURN_PORT}|g" /etc/turnserver.conf

echo "Starting coturn with realm=${TURN_REALM} port=${TURN_PORT}"
exec turnserver -c /etc/turnserver.conf
