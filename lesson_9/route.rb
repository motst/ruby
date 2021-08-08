# frozen_string_literal: true

class Route
  include InstanceCounter
  include Validation

  attr_accessor :stations

  validate :start, :type, Station
  validate :finish, :type, Station

  def initialize(start, finish)
    @stations = [start, finish]
    register_instance
    validate!
  end

  def add(station)
    @stations.insert(-2, station) unless @stations.include?(station)
  end

  def remove(station)
    @stations.delete(station)
  end
end
