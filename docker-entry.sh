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

echo "Starting platform"
cd mattermost
exec ./bin/platform -config=config/config_docker.json
