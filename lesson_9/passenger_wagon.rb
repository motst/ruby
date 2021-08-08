# frozen_string_literal: true

class PassengerWagon < Wagon
  def initialize(total_capacity, type = 'Passenger')
    super
  end

  def filling
    @free_capacity -= 1
    @occupied_capacity += 1
  end
end
