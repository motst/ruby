class Railroad
  attr_accessor :all_stations, :all_routes, :all_trains, :all_wagons

  def initialize
    @all_stations = []
    @all_routes = []
    @all_trains = []
    @all_wagons = []
  end

  def list(all_list)
    all_list.each_with_index do |name, index|
      print index + 1
      print ': '
      puts name
    end
  end
end
