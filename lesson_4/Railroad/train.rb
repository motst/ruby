class Train

  INITIAL_STATION = 0

  attr_reader :number, :type
  attr_accessor :speed, :current_index, :wagons

  def initialize(railroad, number, type)
    @number = number
    @type = type
    @speed = 0
    @wagons = []
    railroad.all_trains << self
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
    route.stations[@current_index].trains
  end

  def previous_station(route)
    route.stations[@current_index - 1].trains if @current_index > 0
  end

  def next_station(route)
    route.stations[@current_index + 1].trains
  end

  def forward(route)
    current_station(route).delete(self)
    next_station(route) << self
    @current_index +=1
  end

  def back(route)
    if @current_index > 0
      current_station(route).delete(self)
      previous_station(route) << self
      @current_index -=1
    end
  end
end
