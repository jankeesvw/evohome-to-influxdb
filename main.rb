#!/usr/local/bin/ruby -w

require "rubygems"
require "bundler"
Bundler.require(:default)

require "evohome"

evohome_username = ENV["EVOHOME_USERNAME"]
evohome_password = ENV["EVOHOME_PASSWORD"]
evohome_application_id = ENV["EVOHOME_APPLICATION_ID"]

evohome = Evohome.new(username: evohome_username, password: evohome_password, application_id: evohome_application_id)
evohome.connect!

puts ENV["HOST"]

influxdb2_host = ENV["INFLUXDB2_HOST"]
influxdb2_port = ENV["INFLUXDB2_PORT"]
influxdb2_org = ENV["INFLUXDB2_ORG"]
influxdb2_bucket = ENV["INFLUXDB2_BUCKET"]
influxdb2_token = ENV["INFLUXDB2_TOKEN"]

influxdb2_url = "http://" + influxdb2_host + ":" + influxdb2_port

puts "influxdb2_url: " influxdb2_url

influxdb = InfluxDB2::Client.new(influxdb2_url, influxdb2_token, bucket: influxdb2_bucket, org: influxdb2_org, precision: InfluxDB2::WritePrecision::NANOSECOND)

puts "Starting script"

loop do
  data = []
  write_api = client.create_write_api

  evohome.thermostats.map do |thermostat|
    data.push({
                series: "Thermostat",
                tags: { name: thermostat.name },
                values: { temperature: thermostat.temperature, temperature_setpoint: thermostat.temperature_setpoint }
              })
  end

  #influxdb.write_points(data)
  write_api.write(data: data)

  puts "Written to InfluxDB: #{data}"

  sleep 60
end
