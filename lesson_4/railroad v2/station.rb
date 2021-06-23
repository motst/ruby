class Station
  attr_reader :name
  attr_accessor :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  private #Методы являются внутренними для этого класса. Извне не используются.

  def arrival(route, train)
    train.forward(route) if train.previous_station(route) == self
    train.back(route) if train.next_station(route) == self
  end

  def departure_forward(route, train)
    train.forward(route) if train.current_station(route) == self
  end

  def departure_back(route, train)
    train.back(route) if train.current_station(route) == self
  end

  def quantity_passenger
    @trains.count { |train| train.type == 'Passenger' }
  end

  def quantity_cargo
    @trains.count { |train| train.type == 'Cargo' }
  end
end
