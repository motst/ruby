class PassengerWagon
  include Manufacturer

  attr_reader :type

  def initialize
    @type = 'Passenger'
  end
end
