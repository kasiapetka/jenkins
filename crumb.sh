#!/bin/bash
crumb=$(curl -u "jenkins:1234" -s 'http://localhost:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
#curl -u "jenkins:1234" -H "$crumb" -X POST http://localhost:8080/job/variables/build?delay=0sec

curl -u "jenkins:1234" -H "$crumb" -X POST  http://localhost:8080/job/backup-to-azure/buildWithParameters?MYSQL_HOST=do_host&MYSQL_DB_NAME=test&CONTAINER_NAME=test
