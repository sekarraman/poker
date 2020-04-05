#!/bin/bash

start() {
   #update DNS
   curl -X POST https://$USER:$PASSWD@domains.google.com/nic/update?hostname=poker.goli.dev
   echo 

   #renew certs
   /usr/local/bin/certbot-auto renew

   #start server
   cd /home/ec2-user/Poker
   PORT=443 /usr/bin/npm run start 
}

stop() {
   kill $(pidof npm)
}

case $1 in
  start|stop) "$1" ;;
esac
