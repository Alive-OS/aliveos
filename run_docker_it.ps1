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

docker build . -t aliveos:latest
# docker rm aliveos_dev_container
docker run --rm -p 2222:22 `
           --name aliveos_dev_container `
           -v $PSScriptRoot/src:/home/aliveos/aliveos_ws/src `
           -it aliveos:latest `
