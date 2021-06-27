class CargoWagon
  include Manufacturer

  attr_reader :type

  def initialize
    @type = 'Cargo'
  end
end
