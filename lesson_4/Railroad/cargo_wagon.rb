class CargoWagon
  attr_reader :type

  def initialize(railroad)
    @type = 'Cargo'
    railroad.all_wagons << self
  end
end
