#!/bin/sh

ENVDIR=/home/env
SERVICE=$1
CMD=$2
COUNTER_FILE=/var/run/${SERVICE}_${CMD}_run
shift 2

if [ ! -f $COUNTER_FILE ]; then
  echo -n "1" > $COUNTER_FILE
fi

CMD_COUNTER=$(cat $COUNTER_FILE)

echo -n $((CMD_COUNTER + 1)) > $COUNTER_FILE
docker-compose -f $ENVDIR/docker-compose-tools.yml run --name "${SERVICE}_${CMD}_run_${CMD_COUNTER}" -v $(pwd):$(pwd) -w $(pwd) $SERVICE $CMD $*
