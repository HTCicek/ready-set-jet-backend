# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

puts 'seeding'
puts 'goodbye, airports of the world'
Location.destroy_all

puts 'goodbye, users of the app'
User.destroy_all

puts 'fetching data from OpenFlights'
airports_response = Faraday.get 'https://raw.githubusercontent.com/jpatokal/openflights/master/data/airports.dat'
puts 'parsing data'
airports_arr_rows = CSV.parse(airports_response.body)
airport_objs = airports_arr_rows.map do |airport|
  {
    name: airport[1],
    city: airport[2],
    country: airport[3],
    iata: airport[4],
    icao: airport[5],
    latitude: airport[6],
    longitude: airport[7],
    altitude: airport[8],
    timezone: airport[9],
    dst: airport[10],
    tz_olson: airport[11],
    data_type: airport[12],
    source_type: airport[13]
  }
end

puts 'creating new locations'
Location.create(airport_objs)
puts 'so many airports to choose from!'

puts 'creating some users'
User.create(
  [
    {username: 'usereugene', email: 'eugene@gmail.com', password: 'password'},
    {username: 'turcancicek', email: 'hcicek2811@gmail.com', password: 'password'}
  ]
)
