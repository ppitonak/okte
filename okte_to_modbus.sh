#!/bin/sh

TOMORROW=$(date -d tomorrow "+%Y-%m-%d")
OKTE_URL="https://isot.okte.sk/api/v1/dam/results?deliverydayfrom=${TOMORROW}&deliverydayto=${TOMORROW}"

DATA=$(curl -G ${OKTE_URL})

for I in $(seq 1 24); do 
	PRICE=$(echo $DATA | jq ".[] | select(.period | contains($I)) | .price")
       	echo "price for period $I: $PRICE"

	#TODO
	send data to modbus here
done

