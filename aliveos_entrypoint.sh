#!/usr/bin/env bash
set -e

source "/opt/ros/foxy/setup.bash" --
/usr/sbin/sshd -D &  # TODO run if the process doesnt exist

exec "$@"
