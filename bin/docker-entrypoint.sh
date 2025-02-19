#!/bin/bash
# docker-entrypoint.sh
set -e
# Run database migrations (only if DB is ready)
echo "Running database migrations..."
bundle exec rake db:migrate

# Start the Rails app
echo "Starting the Rails app..."
exec "$@"
