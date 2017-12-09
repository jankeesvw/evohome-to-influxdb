# Evohome to InfluxDB

This is a docker container that pushes data from the Honeywell Evohome API to InfluxDB.

To use this run:

```bash
docker run -e INFLUX_DATABASE=domoticz \
  -e INFLUX_USERNAME=root \
  -e INFLUX_PASSWORD=pass \
  -e INFLUX_HOST=192.168.1.9 \
  -e EMAIL=email-adres-for-honeywell@example.com \
  -e PASSWORD=password-for-honeywell \
  -e APP=apikey-for-honeywell jankeesvw/evohome-to-influxdb
```
