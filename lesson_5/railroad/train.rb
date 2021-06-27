class Train
  include Manufacturer
  include InstanceCounter

  INITIAL_STATION = 0

  attr_reader :number, :type
  attr_accessor :speed, :current_index, :wagons

  def self.find(number)
    ObjectSpace.each_object(self).to_a.find { |train| train.number == number }
  end

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @wagons = []
    register_instance
  end

  def go
    @speed += 50
  end

  def stop
    @speed = 0
  end

  def attach(wagon)
    @wagons << wagon if @speed == 0 && @type == wagon.type && !@wagons.include?(wagon)
  end

  def detach(wagon)
    @wagons.delete(wagon) if @speed == 0
  end

  def purpose(route)
    route.stations[INITIAL_STATION].trains << self unless route.stations[INITIAL_STATION].trains.include?(self)
    @current_index = INITIAL_STATION
  end

  def current_station(route)
    route.stations[@current_index]
  end

  def previous_station(route)
    route.stations[@current_index - 1] if @current_index > 0
  end

  def next_station(route)
    route.stations[@current_index + 1]
  end

  def forward(route)
    route.stations[@current_index].trains.delete(self)
    @current_index +=1
    route.stations[@current_index].trains << self
  end

  def back(route)
    if @current_index > 0
      route.stations[@current_index].trains.delete(self)
      @current_index -=1
      route.stations[@current_index].trains << self
    end
  end
end

