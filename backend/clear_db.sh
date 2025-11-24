#!/bin/bash
cd "$(dirname "$0")"

echo "Stopping containers..."
docker-compose down

echo "Clearing database data..."
rm -rf data/postgres/*

