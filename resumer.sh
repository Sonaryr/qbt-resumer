#!/bin/bash
while true
do
  echo 'Checking errored torrents...'
  RESULTS=`qbt torrent list --username $QBT_USER --password $QBT_PASSWORD --url $QBT_URL --format json --filter errored | jq -r '.[].hash'`

  if [ ! -z "$RESULTS" ]; then
  echo $RESULTS | while IFS= read -r line ; do  qbt torrent resume --username $QBT_USER --password $QBT_PASSWORD --url $QBT_URL $line; done
  else
    echo 'No errored torrent found'
  fi
  echo 'Done, sleeping...'
  sleep $QBT_RECHECK_SECONDS
done