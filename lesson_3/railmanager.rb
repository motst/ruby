class Station
  attr_reader :name
  attr_accessor :trains, :trains_types

  def initialize(name)
    @name = name
    @trains = []
  end

  def list_trains
    @trains.each { |x| puts x.number }
  end

  def list_types
    @trains_types = {}
    @trains.each { |x| trains_types[x.number] = x.type }
    puts "Total passenger trains: #{ @trains_types.values.count('Passenger') }"
    puts "Total cargo trains: #{ @trains_types.values.count('Cargo') }"
  end
end


class Route
  attr_accessor :stations

  def initialize(start, finish)
    @stations = [ start, finish ]
  end

  def add(station)
    @stations.insert(-2, station)
  end

  def remove(station)
    @stations.delete(station)
  end

  def list_stations
    @stations.each { |x| puts x.name }
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
    if @speed == 0
      @wagons +=1
    else
      puts 'Train on the way'
    end
  end

  def detach_wagon
    if @speed == 0
      @wagons -=1
    else
      puts 'Train on the way'
    end
  end

  def purpose(route)
    @current_index = 0
    route.stations[@current_index].trains << self
  end

  def forward(route)
    if route.stations[@current_index].trains.include?(self)
      route.stations[@current_index].trains.delete(self)
      @current_index +=1
      route.stations[@current_index].trains << self
    else
      puts 'Wrong route selected'
    end
  end

  def back(route)
    if route.stations[@current_index].trains.include?(self)
      if @current_index > 0
        route.stations[@current_index].trains.delete(self)
        @current_index -=1
        route.stations[@current_index].trains << self
      else
        puts 'Train on the first station'
      end
    else
      puts 'Wrong route selected'
    end
  end

  def near_station(route)
    if route.stations[@current_index].trains.include?(self)
      if @current_index > 0
        puts "Previous station #{route.stations[@current_index -1].name}"
      else
        puts 'Train on the first station'
      end
      puts "Current station #{route.stations[@current_index].name}"
      puts "Next station #{route.stations[@current_index +1].name}"
    else
      puts 'Wrong route selected'
    end
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
