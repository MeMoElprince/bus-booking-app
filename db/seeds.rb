# db/seeds.rb

# Create cities
cairo = City.create!(name: "Cairo")
giza = City.create!(name: "Giza")
fayum = City.create!(name: "Fayum")
minya = City.create!(name: "Minya")
asyut = City.create!(name: "Asyut")

# Create routes
cairo_to_giza = Route.create!(city1: cairo, city2: giza, cost: 5, duration: 1)
giza_to_cairo = Route.create!(city1: giza, city2: cairo, cost: 5, duration: 1)
cairo_to_fayum = Route.create!(city1: cairo, city2: fayum, cost: 10, duration: 2)
fayum_to_cairo = Route.create!(city1: fayum, city2: cairo, cost: 10, duration: 2)
giza_to_fayum = Route.create!(city1: giza, city2: fayum, cost: 10, duration: 2)
fayum_to_giza = Route.create!(city1: fayum, city2: giza, cost: 10, duration: 2)
fayum_to_minya = Route.create!(city1: fayum, city2: minya, cost: 15, duration: 2)
minya_to_fayum = Route.create!(city1: minya, city2: fayum, cost: 15, duration: 2)
minya_to_asyut = Route.create!(city1: minya, city2: asyut, cost: 12, duration: 2)
asyut_to_minya = Route.create!(city1: asyut, city2: minya, cost: 12, duration: 2)

# Create buses
buses = []
6.times { buses << Bus.create! }

# Create seats
buses.each_with_index do |bus, index|
  12.times { |seat_number| Seat.create!(bus: bus, number: seat_number + 1) }
end

# Create trips
trip1 = Trip.create!(bus: buses[0], departure_time: "2024-07-20T09:00:00.000Z", departure_city: giza, arrival_city: asyut)
trip2 = Trip.create!(bus: buses[1], departure_time: "2024-07-20T09:00:00.000Z", departure_city: cairo, arrival_city: asyut)
trip3 = Trip.create!(bus: buses[2], departure_time: "2024-07-20T10:00:00.000Z", departure_city: cairo, arrival_city: giza)
trip4 = Trip.create!(bus: buses[3], departure_time: "2024-07-20T10:00:00.000Z", departure_city: giza, arrival_city: cairo)
trip5 = Trip.create!(bus: buses[4], departure_time: "2024-07-20T09:00:00.000Z", departure_city: asyut, arrival_city: giza)
trip6 = Trip.create!(bus: buses[5], departure_time: "2024-07-20T09:00:00.000Z", departure_city: asyut, arrival_city: cairo)


# Create trip_routes

trip1.trip_routes.create!(route: giza_to_fayum)
trip1.trip_routes.create!(route: fayum_to_minya)
trip1.trip_routes.create!(route: minya_to_asyut)

trip2.trip_routes.create!(route: cairo_to_fayum)
trip2.trip_routes.create!(route: fayum_to_minya)
trip2.trip_routes.create!(route: minya_to_asyut)

trip3.trip_routes.create!(route: cairo_to_giza)

trip4.trip_routes.create!(route: giza_to_cairo)

trip5.trip_routes.create!(route: asyut_to_minya)
trip5.trip_routes.create!(route: minya_to_fayum)
trip5.trip_routes.create!(route: fayum_to_giza)

trip6.trip_routes.create!(route: asyut_to_minya)
trip6.trip_routes.create!(route: minya_to_fayum)
trip6.trip_routes.create!(route: fayum_to_cairo)

