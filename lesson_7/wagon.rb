class Wagon
  include Manufacturer
  include InstanceCounter

  attr_reader :type, :number, :total_capacity
  attr_accessor :free_capacity, :occupied_capacity

  def initialize(total_capacity, type)
    @type = type
    @total_capacity = total_capacity.to_i
    @free_capacity = total_capacity.to_i
    @occupied_capacity = 0
    register_instance
    @number = self.class.instances
  end
end
