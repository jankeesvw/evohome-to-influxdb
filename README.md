# evohome-influxdbv2

This is a docker container that pushes data from the Honeywell Evohome API to InfluxDB. Based on work of jankeesvw [evohome-to-influxdb] (https://github.com/jankeesvw/evohome-to-influxdb)

Updated for InfluxDBv2.

## How to run
```
$ docker run -d \
 -e EVOHOME_CONSUMER_KEY="<EvoHome Consumer Key>" \
 -e EVOHOME_USERNAME="<EvoHome USERNAME>" \
 -e EVOHOME_PASSWORD="<EvoHome PASSWORD>" \
 -e INFLUXDB2_HOST="<INFLUXDBv2 SERVER>" \
 -e INFLUXDB2_PORT="8086" \
 -e INFLUXDB2_ORG="" \
 -e INFLUXDB2_TOKEN="" \
 -e INFLUXDB2_BUCKET="netatmo" \
 --name "evohome-influxdbv2" \
dbsqp/evohome-influxdbv2:latest
```

## Setup Evohome Consumer Key

1. Sign up at honeywell developer home: https://developer.honeywellhome.com
2. Create a new app, use as callback url: 'none'
3. Click on the app name to see the generated consumer key and consumer secret




