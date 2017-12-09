#!/usr/local/bin/ruby -w

require "rubygems"
require "bundler"
Bundler.require(:default)

require "evohome"

email = ENV["EMAIL"]
password = ENV["PASSWORD"]
application_id = ENV["APP"]

evohome = Evohome.new(username: email, password: password, application_id: application_id)
evohome.connect!

puts ENV["HOST"]


influxdb = InfluxDB::Client.new(ENV["INFLUX_DATABASE"], { host: ENV["INFLUX_HOST"],
                                                          username: ENV["INFLUX_USERNAME"],
                                                          password: ENV["INFLUX_PASSWORD"],
                                                          time_precision: "s" })

puts "Starting script"

loop do
  data = []

  evohome.thermostats.map do |thermostat|
    data.push({
                series: "Thermostat",
                tags: { name: thermostat.name },
                values: { temperature: thermostat.temperature, temperature_setpoint: thermostat.temperature_setpoint }
              })
  end

  influxdb.write_points(data)

  puts "Written to InfluxDB: #{data}"

  sleep 60
end
