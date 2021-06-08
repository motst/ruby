class Station
  attr_reader :name
  attr_accessor :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def arival(train)
    @trains << train
  end

  def departure(train)
    @trains.delete(train)
  end

  def quantity_passengers
    @trains.count { |x| x.type == 'Passenger' }
  end

  def quantity_cargo
    @trains.count { |x| x.type == 'Cargo' }
  end
end


class Route
  attr_reader :stations

  def initialize(start, finish)
    @stations = [ start, finish ]
  end

  def add(station)
    @stations.insert(-2, station)
  end

  def remove(station)
    @stations.delete(station)
  end
end


class Train
  attr_reader :number, :type
  attr_accessor :speed, :wagons, :current_index

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def go
    @speed = 50
  end

  def stop
    @speed = 0
  end

  def attach_wagon
    @wagons +=1 if @speed == 0
  end

  def detach_wagon
    @wagons -=1 if @speed == 0
  end

  def purpose(route)
    @current_index = 0
    route.stations[@current_index].trains << self
  end

  def forward(route)
    route.stations[@current_index].trains.delete(self)
    @current_index +=1
    route.stations[@current_index].trains << self
    end
  end

  def back(route)
    if @current_index > 0
      route.stations[@current_index].trains.delete(self)
      @current_index -=1
      route.stations[@current_index].trains << self
    end
  end

  def current_station(route)
    route.stations[@current_index]
  end

  def previous_station(route)
    route.stations[@current_index -1] if @current_index > 0
  end

  def next_station(route)
    route.stations[@current_index +1]
  end
end




moscow = Station.new('Moscow')
omsk = Station.new('Omsk')
novosibirsk = Station.new('Novosibirsk')
krasnoyarsk = Station.new('Krasnoyarsk')
irkutsk = Station.new('Irkutsk')
vladivostok = Station.new('Vladivostok')
route1 = Route.new(moscow, vladivostok)
route2 = Route.new(irkutsk, vladivostok)
route1.add(omsk)
route1.add(novosibirsk)
route1.add(irkutsk)
route1.add(krasnoyarsk)
route1.remove(krasnoyarsk)
route2.add(krasnoyarsk)
train1 = Train.new(1540, 'Passenger', 45)
train2 = Train.new(2350, 'Cargo', 23)
train3 = Train.new(4450, 'Passenger', 37)
train4 = Train.new(1234, 'Passenger', 53)
train5 = Train.new(987, 'Cargo', 26)
train6 = Train.new(4675, 'Passenger', 24)
train7 = Train.new(3333, 'Cargo', 30)
train7.purpose(route1)
train6.purpose(route2)
train7.forward(route1)
train6.forward(route2)
train6.back(route2)
omsk.add(train1)
omsk.add(train2)
omsk.add(train3)
