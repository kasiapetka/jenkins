#!/bin/bash

DB_HOST=$1
DB_PASS=$2
DB_NAME=$3
CONTAINER_NAME=$4
CONNECTION_STRING=$5

DATE=$(date +%d%m%Y-%H:%M)
BACKUP_NAME=db-snap-$DATE.sql

mysqldump -u root -h $DB_HOST  -p$DB_PASS $DB_NAME > /tmp/$BACKUP_NAME && \

export CONN_STR=$CONNECTION_STRING && \
export CONT=$CONTAINER_NAME && \

echo "Uploading $BACKUP_NAME ..."

az storage blob upload --connection-string $CONN_STR  --container-name $CONT  --file /tmp/$BACKUP_NAME --name $BACKUP_NAME