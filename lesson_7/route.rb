class Route
  include InstanceCounter
  include Valid

  NUMBER_FORMAT = /^[\d]{3}$/

  attr_accessor :stations

  def initialize(start, finish, number)
    @stations = [start, finish]
    @number = number
    register_instance
    validate!
  end

  def add(station)
    @stations.insert(-2, station) unless @stations.include?(station)
  end

  def remove(station)
    @stations.delete(station)
  end

  protected

  def validate!
    raise 'Number has invalid format' if @number !~ NUMBER_FORMAT
  end
end
