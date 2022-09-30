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

cp $PRIVATE_KEY $SSH_DIR -Force
$ip = $(docker inspect -f "{{ .NetworkSettings.IPAddress }}" aliveos_dev_container)
code --file-uri=vscode-remote://ssh-remote+aliveos@localhost:2222/aliveos_ws/
