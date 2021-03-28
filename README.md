# Evohome to InfluxDBv2

This is a docker container that pushes data from the Honeywell Evohome API to InfluxDB. Based on work of jankeesvw [evohome-to-influxdb] (https://github.com/jankeesvw/evohome-to-influxdb)

## How to run
```
$ docker run -d \
 -e EVOHOME_API_KEY="<EvoHome API Key>" \
 -e EVOHOME_USERNAME="<EvoHome USERNAME>" \
 -e EVOHOME_PASSWORD="<EvoHome PASSWORD>" \
 -e INFLUXDB2_HOST="<INFLUXDBv2 SERVER>" \
 -e INFLUXDB2_PORT="8086" \
 -e INFLUXDB2_ORG="" \
 -e INFLUXDB2_TOKEN="" \
 -e INFLUXDB2_BUCKET="netatmo" \
 --name "evohome-to-influxdbv2" \
dbsqp/evohome-to-influxdbv2:latest
```

INFLUX_DATABASE \
INFLUX_USERNAME \
INFLUX_PASSWORD \
INFLUX_HOST \
  
EMAIL=email-adres-for-honeywell \
PASSWORD=password-for-honeywell \
APP=apikey-for-honeywell
