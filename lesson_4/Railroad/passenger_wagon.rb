class PassengerWagon
  attr_reader :type

  def initialize(railroad, type = 'Passenger')
    @type = type
    railroad.all_wagons << self
  end
end
