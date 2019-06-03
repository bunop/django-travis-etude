#!/bin/sh
# wait-for-mysql.sh
# https://docs.docker.com/compose/startup-order/
# https://stackoverflow.com/q/12321469/4385116

set -e

cmd="$@"

NEXT_WAIT_TIME=0
MAX_STEPS=6

until mysql -h db -u ${MYSITE_USER} --password=${MYSITE_PASSWORD} -N -s -e "SHOW GRANTS FOR '${MYSITE_USER}'@'%'" || [ ${NEXT_WAIT_TIME} -eq ${MAX_STEPS} ]; do
  >&2 echo "MySQL is unavailable - sleeping"
  sleep 5
  NEXT_WAIT_TIME=$((NEXT_WAIT_TIME+1))
done

>&2 echo "MySQL is up - executing command"
exec $cmd
