class PassengerWagon
  attr_reader :type

  def initialize(railroad)
    @type = 'Passenger'
    railroad.all_wagons << self
  end
end
