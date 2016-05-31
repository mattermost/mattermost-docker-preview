#!/bin/bash
# Copyright (c) 2016 Mattermost, Inc. All Rights Reserved.
# See License.txt for license information.

echo starting mysql
/entrypoint.sh mysqld &

sleep 20

echo starting platform
cd mattermost
./bin/platform -config=config/config_docker.json
sleep 1000000
