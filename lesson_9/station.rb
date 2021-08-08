# frozen_string_literal: true

class Station
  include InstanceCounter
  include Validation
  include Accessors

  attr_reader :name
  attr_accessor :trains

  attr_accessor_with_history :test1, :test2
  strong_attr_accessor 'test4', String

  validate :name, :type, String

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def initialize(name)
    @name = name
    @trains = []
    register_instance
    validate!
  end

  def each_train(train_block)
    @trains.each(&train_block)
  end

  protected

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
