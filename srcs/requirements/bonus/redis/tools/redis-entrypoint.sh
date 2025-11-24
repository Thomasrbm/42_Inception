#!/bin/sh
set -e

mkdir -p /data

echo "Starting Redis with /etc/redis.conf..."
exec redis-server /etc/redis.conf
