#!/bin/sh
DEVLOC=/dev/sda2
# openFleets: configure hostname
curl -X PATCH --header "Content-Type:application/json" \
    --data "{\"network\": {\"hostname\": \"$BALENA_HOSTNAME\"}}" \
    "$BALENA_SUPERVISOR_ADDRESS/v1/device/host-config?apikey=$BALENA_SUPERVISOR_API_KEY"

echo " Mounting $DEVLOC"
mkdir /mnt/sda2
mount $DEVLOC /mnt/sda2
chmod 707 /mnt/sda2
ls -al

exec /entrypoint.sh php-fpm
