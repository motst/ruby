def seed
  interface.all_stations << Station.new('Moscow')
  interface.all_stations << Station.new('Omsk')
  interface.all_stations << Station.new('Novosibirsk')
  interface.all_stations << Station.new('Krasnoyarsk')
  interface.all_stations << Station.new('Irkutsk')
  interface.all_stations << Station.new('Vladivostok')
  interface.all_routes << Route.new(interface.all_stations[0], interface.all_stations[5])
  interface.all_routes << Route.new(interface.all_stations[2], interface.all_stations[5])
  interface.all_trains << PassengerTrain.new(1540)
  interface.all_trains << CargoTrain.new(2350)
  interface.all_trains << PassengerTrain.new(4450)
  interface.all_trains << PassengerTrain.new(1234)
  interface.all_trains << CargoTrain.new(987)
  interface.all_trains << PassengerTrain.new(4675)
  interface.all_trains << CargoTrain.new(3333)
  interface.all_wagons << PassengerWagon.new
  interface.all_wagons << CargoWagon.new
  interface.all_wagons << PassengerWagon.new
  interface.all_wagons << PassengerWagon.new
  interface.all_wagons << CargoWagon.new
  interface.all_wagons << PassengerWagon.new
  interface.all_wagons << CargoWagon.new
  interface.all_routes[0].add(interface.all_stations[1])
  interface.all_routes[0].add(interface.all_stations[3])
  interface.all_routes[0].add(interface.all_stations[4])
  interface.all_routes[1].add(interface.all_stations[3])
  interface.all_routes[1].add(interface.all_stations[4])
  interface.all_trains[0].purpose(interface.all_routes[0])
  interface.all_trains[1].purpose(interface.all_routes[0])
  interface.all_trains[2].purpose(interface.all_routes[0])
  interface.all_trains[3].purpose(interface.all_routes[1])
  interface.all_trains[4].purpose(interface.all_routes[1])
  interface.all_trains[5].purpose(interface.all_routes[1])
  interface.all_trains[6].purpose(interface.all_routes[0])
  interface.all_trains[0].forward(interface.all_routes[0])
  interface.all_trains[0].forward(interface.all_routes[0])
  interface.all_trains[1].forward(interface.all_routes[0])
  interface.all_trains[3].forward(interface.all_routes[1])
  interface.all_trains[3].forward(interface.all_routes[1])
  interface.all_trains[5].forward(interface.all_routes[1])
  interface.all_trains[0].attach(interface.all_wagons[0])
  interface.all_trains[1].attach(interface.all_wagons[1])
  interface.all_trains[1].attach(interface.all_wagons[4])
  interface.all_trains[2].attach(interface.all_wagons[2])
  interface.all_trains[2].attach(interface.all_wagons[5])
end
