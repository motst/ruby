class Station
  attr_reader :name
  attr_accessor :trains

  def initialize(railroad, name)
    @name = name
    @trains = []
    railroad.all_stations << self
  end

  private #Методы являются внутренними для этого класса. Извне не используются.

  def arrival(route, train)
    train.forward(route) if train.previous_station(route) == self
    train.back(route) if train.next_station(route) == self
  end

  def departure_forward(route, train)
    train.forward(route)
  end

  def departure_back(route, train)
    train.back(route)
  end

  def quantity_by_type
    @trains.count { |train| train.type == 'Passenger' }
    @trains.count { |train| train.type == 'Cargo' }
  end
end
