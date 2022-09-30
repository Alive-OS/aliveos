#!/usr/bin/env bash
set -e

source "/opt/ros/foxy/setup.bash" --
/usr/sbin/sshd -D &

exec "$@"
