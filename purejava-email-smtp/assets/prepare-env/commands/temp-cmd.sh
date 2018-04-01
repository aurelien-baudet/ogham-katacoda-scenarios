#!/bin/bash

SERVICE=$1
CMD=$2
sp="/-\|"
sc=0
shift 2


spin() {
   printf "\b${sp:sc++:1}"
   ((sc==${#sp})) && sc=0
}
endspin() {
   printf "\r%s\n" "$@"
}



if [ ! -f /var/run/$CMD-ready ]; then
  echo "$CMD is not ready yet"
  echo "please wait a few seconds..."

  until [ -f /var/run/$CMD-ready ]; do
    spin
    sleep 0.05
  done
  endspin
fi


/home/env/commands/cmd-through-docker.sh $SERVICE $CMD $*