def seed(railroad)
  Station.new(railroad, 'Moscow')
  Station.new(railroad, 'Omsk')
  Station.new(railroad, 'Novosibirsk')
  Station.new(railroad, 'Krasnoyarsk')
  Station.new(railroad, 'Irkutsk')
  Station.new(railroad, 'Vladivostok')
  Route.new(railroad, railroad.all_stations[0], railroad.all_stations[5])
  Route.new(railroad, railroad.all_stations[2], railroad.all_stations[5])
  PassengerTrain.new(railroad, 1540)
  CargoTrain.new(railroad, 2350)
  PassengerTrain.new(railroad, 4450)
  PassengerTrain.new(railroad, 1234)
  CargoTrain.new(railroad, 987)
  PassengerTrain.new(railroad, 4675)
  CargoTrain.new(railroad, 3333)
  PassengerWagon.new(railroad)
  CargoWagon.new(railroad)
  PassengerWagon.new(railroad)
  PassengerWagon.new(railroad)
  CargoWagon.new(railroad)
  PassengerWagon.new(railroad)
  CargoWagon.new(railroad)
  railroad.all_routes[0].add(railroad.all_stations[1])
  railroad.all_routes[0].add(railroad.all_stations[3])
  railroad.all_routes[0].add(railroad.all_stations[4])
  railroad.all_routes[1].add(railroad.all_stations[3])
  railroad.all_routes[1].add(railroad.all_stations[4])
  railroad.all_trains[0].purpose(railroad.all_routes[0])
  railroad.all_trains[1].purpose(railroad.all_routes[0])
  railroad.all_trains[2].purpose(railroad.all_routes[0])
  railroad.all_trains[3].purpose(railroad.all_routes[1])
  railroad.all_trains[4].purpose(railroad.all_routes[1])
  railroad.all_trains[5].purpose(railroad.all_routes[1])
  railroad.all_trains[6].purpose(railroad.all_routes[0])
  railroad.all_trains[0].forward(railroad.all_routes[0])
  railroad.all_trains[0].forward(railroad.all_routes[0])
  railroad.all_trains[1].forward(railroad.all_routes[0])
  railroad.all_trains[3].forward(railroad.all_routes[1])
  railroad.all_trains[3].forward(railroad.all_routes[1])
  railroad.all_trains[5].forward(railroad.all_routes[1])
  railroad.all_trains[0].attach(railroad.all_wagons[0])
  railroad.all_trains[1].attach(railroad.all_wagons[1])
  railroad.all_trains[1].attach(railroad.all_wagons[4])
  railroad.all_trains[2].attach(railroad.all_wagons[2])
  railroad.all_trains[2].attach(railroad.all_wagons[5])
end