# *************************************************************************
#
# Copyright (c) 2022 Andrei Gramakov. All rights reserved.
#
# This file is licensed under the terms of the MIT license.  
# For a copy, see: https://opensource.org/licenses/MIT
#
# site:    https://agramakov.me
# e-mail:  mail@agramakov.me
#
# *************************************************************************


$PRIVATE_KEY = "$PSScriptRoot/docker/aliveos_container_rsa"
$PUBLIC_KEY = "$PSScriptRoot/docker/aliveos_container_rsa.pub"
$SSH_DIR = "~/.ssh"
$TARGET_HOST = "localhost:2222"

cp $PRIVATE_KEY $SSH_DIR -Force
$ip = $(docker inspect -f "{{ .NetworkSettings.IPAddress }}" aliveos_dev_container)

# Remove the old key(s) from known_hosts
ssh-keygen -R $TARGET_HOST

code --file-uri=vscode-remote://ssh-remote+aliveos@$TARGET_HOST/home/aliveos/aliveos_ws
