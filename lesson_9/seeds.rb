# frozen_string_literal: true

module Seeds
  def station_new
    @all_stations << Station.new('Moscow')
    @all_stations << Station.new('Omsk')
    @all_stations << Station.new('Novosibirsk')
    @all_stations << Station.new('Krasnoyarsk')
    @all_stations << Station.new('Irkutsk')
    @all_stations << Station.new('Vladivostok')
  end

  def route_new
    @all_routes << Route.new(@all_stations[0], @all_stations[5])
    @all_routes << Route.new(@all_stations[2], @all_stations[5])
  end

  def train_new
    @all_trains << PassengerTrain.new('111-11')
    @all_trains << CargoTrain.new('222-22')
    @all_trains << PassengerTrain.new('333-33')
    @all_trains << PassengerTrain.new('444-44')
    @all_trains << CargoTrain.new('555-55')
    @all_trains << PassengerTrain.new('666-66')
    @all_trains << CargoTrain.new('777-77')
  end

  def wagon_new
    @all_wagons << PassengerWagon.new(80)
    @all_wagons << CargoWagon.new(1500)
    @all_wagons << PassengerWagon.new(70)
    @all_wagons << PassengerWagon.new(70)
    @all_wagons << CargoWagon.new(1600)
    @all_wagons << PassengerWagon.new(80)
    @all_wagons << CargoWagon.new(1600)
  end

  def station_seeds
    @all_routes[0].add(@all_stations[1])
    @all_routes[0].add(@all_stations[3])
    @all_routes[0].add(@all_stations[4])
    @all_routes[1].add(@all_stations[3])
    @all_routes[1].add(@all_stations[4])
  end

  # rubocop: disable Metrics/AbcSize
  def train_seeds
    @all_trains[0].purpose(@all_routes[0])
    @all_trains[1].purpose(@all_routes[0])
    @all_trains[2].purpose(@all_routes[0])
    @all_trains[3].purpose(@all_routes[1])
    @all_trains[4].purpose(@all_routes[1])
    @all_trains[5].purpose(@all_routes[1])
    @all_trains[6].purpose(@all_routes[0])
  end

  def move_seeds
    @all_trains[0].forward(@all_routes[0])
    @all_trains[0].forward(@all_routes[0])
    @all_trains[1].forward(@all_routes[0])
    @all_trains[3].forward(@all_routes[1])
    @all_trains[3].forward(@all_routes[1])
    @all_trains[5].forward(@all_routes[1])
  end
  # rubocop: enable Metrics/AbcSize

  def wagon_seeds
    @all_trains[0].attach(@all_wagons[0])
    @all_trains[1].attach(@all_wagons[1])
    @all_trains[1].attach(@all_wagons[4])
    @all_trains[2].attach(@all_wagons[2])
    @all_trains[2].attach(@all_wagons[5])
  end
end
