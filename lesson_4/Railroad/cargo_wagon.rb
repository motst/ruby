class CargoWagon
  attr_reader :type

  def initialize(railroad, type = 'Cargo')
    @type = type
    railroad.all_wagons << self
  end
end
