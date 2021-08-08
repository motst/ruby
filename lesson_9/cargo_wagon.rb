# frozen_string_literal: true

class CargoWagon < Wagon
  def initialize(total_capacity, type = 'Cargo')
    super
  end

  def filling(capacity)
    @free_capacity -= capacity
    @occupied_capacity += capacity
  end
end
