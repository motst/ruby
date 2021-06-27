class Route
  include InstanceCounter

  attr_accessor :stations

  def initialize(start, finish)
    @stations = [start, finish]
    register_instance
  end

  def add(station)
    @stations.insert(-2, station) unless @stations.include?(station)
  end

  def remove(station)
    @stations.delete(station)
  end
end
