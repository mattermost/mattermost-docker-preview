#!/bin/bash
# Copyright (c) 2016 Mattermost, Inc. All Rights Reserved.
# See License.txt for license information.

if [ "x${START_MYSQL,,}" != "xfalse" ]; then
	echo "Starting MySQL"
	/entrypoint.sh mysqld &

	until mysqladmin -hlocalhost -P3306 -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" processlist &> /dev/null; do
		echo "MySQL still not ready, sleeping"
		sleep 5
	done
fi

echo "Updating CA certificates"
update-ca-certificates --fresh >/dev/null

echo "Starting platform"
cd mattermost
exec ./bin/mattermost --config=config/config_docker.json
