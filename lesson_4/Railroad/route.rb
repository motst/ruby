class Route
  attr_accessor :stations

  def initialize(railroad, start, finish)
    @stations = [start, finish]
    railroad.all_routes << self
  end

  def add(station)
    @stations.insert(-2, station) unless @stations.include?(station)
  end

  def remove(station)
    @stations.delete(station)
  end
end
