#!/bin/bash
set -e
rm -f /depot/tmp/pids/server.pid

exec "$@"