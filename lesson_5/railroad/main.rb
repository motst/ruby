require_relative 'instance_counter'
require_relative 'manufacturer'
require_relative 'seed'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

class Interface
  attr_accessor :all_stations, :all_routes, :all_trains, :all_wagons

  def initialize
    @all_stations = []
    @all_routes = []
    @all_trains = []
    @all_wagons = []
  end

  def menu
    loop do
      puts 'Enter 1 to create a station, route, train or wagon'
      puts 'Enter 2 to perform operations on the created objects'
      puts 'Enter 3 to display the current information about the objects'
        case gets.chomp.to_i
        when 1
          puts 'Enter 1 to create a new station'
          puts 'Enter 2 to create a new route'
          puts 'Enter 3 to create a new train'
          puts 'Enter 4 to create a new wagon'
            case gets.chomp.to_i
            when 1
              create_station
            when 2
              create_route
            when 3
              create_train
            when 4
              create_wagon
            end
        when 2
          puts 'Enter 1 to add a station to the route'
          puts 'Enter 2 to remove a station from the route'
          puts 'Enter 3 to assign a route for the train'
          puts 'Enter 4 to send the train forwad'
          puts 'Enter 5 to send the train back'
          puts 'Enter 6 to attach a wagon to the train'
          puts 'Enter 7 to detach a wagon from the train'
            case gets.chomp.to_i
            when 1
              add_station
            when 2
              remove_station
            when 3
              purpose_station
            when 4
              train_forward
            when 5
              train_back
            when 6
              attach_wagon
            when 7
              detach_wagon
            end
        when 3
          view_list
        end
    end
  end

  def create_station
    puts 'Enter name of the new station'
    @all_stations << Station.new(gets.chomp)
  end

  def create_route
    list(@all_stations)
    puts 'Choose the start point for the new route'
    start = @all_stations[gets.chomp.to_i - 1]
    puts 'Choose the finish point for the new route'
    finish = @all_stations[gets.chomp.to_i - 1]
    @all_routes << Route.new(start, finish)
  end

  def create_train
    puts 'Enter the number for the new train'
    number = gets.chomp.to_i
    puts '1: Passenger'
    puts '2: Cargo'
    puts 'Choose the type for the new train'
    gets.chomp.to_i == 1 ? @all_trains << PassengerTrain.new(number) : @all_trains << CargoTrain.new(number)
  end

  def create_wagon
    puts '1: Passenger'
    puts '2: Cargo'
    puts 'Choose the type for the new wagon'
    gets.chomp.to_i == 1 ? @all_wagons << PassengerWagon.new : @all_wagons << CargoWagon.new
  end

  def add_station
    list(@all_stations)
    puts 'Choose the station to add to the route'
    station = @all_stations[gets.chomp.to_i - 1]
    list(@all_routes)
    puts 'Choose the route you want to add the selected station to'
    route = @all_routes[gets.chomp.to_i - 1]
    route.add(station)
  end

  def remove_station
    list(@all_stations)
    puts 'Choose the station to remove from the route'
    station = @all_stations[gets.chomp.to_i - 1]
    list(@all_routes)
    puts 'Choose the route you want to remove the selected station from'
    route = @all_routes[gets.chomp.to_i - 1]
    route.remove(station)
  end

  def train_purpose
    list(@all_trains)
    puts 'Choose the train to purpose the route to'
    train = @all_trains[gets.chomp.to_i - 1]
    list(@all_routes)
    puts 'Choose the route you want to purpose to the selected train'
    route = @all_routes[gets.chomp.to_i - 1]
    train.purpose(route)
  end

  def train_forward
    list(@all_trains)
    puts 'Choose the train to send forward'
    train = @all_trains[gets.chomp.to_i - 1]
    list(@all_routes)
    puts 'Choose the route you want to send the train to'
    route = @all_routes[gets.chomp.to_i - 1]
    train.forward(route)
  end

  def train_back
    list(@all_trains)
    puts 'Choose the train to send back'
    train = @all_trains[gets.chomp.to_i - 1]
    list(@all_routes)
    puts 'Choose the route you want to send the train to'
    route = @all_routes[gets.chomp.to_i - 1]
    train.forward(route)
    train.back(route)
  end

  def attach_wagon
    list(@all_wagons)
    puts 'Choose the wagon to attach to the train'
    wagon = @all_wagons[gets.chomp.to_i - 1]
    list(@all_trains)
    puts 'Choose the train to which you want to add the selected wagon'
    train = @all_trains[gets.chomp.to_i - 1]
    train.attach(wagon)
  end

  def detach_wagon
    list(@all_wagons)
    puts 'Choose the of wagon to detach from the train'
    wagon = @all_wagons[gets.chomp.to_i - 1]
    list(@all_trains)
    puts 'Choose the of train from which you want to detach the selected wagon'
    train = @all_trains[gets.chomp.to_i - 1]
    train.detach(wagon)
  end

  def list(all_list)
    all_list.each_with_index do |name, index|
      print index + 1
      print ': '
      puts name
    end
  end

  def view_list
    list(@all_stations)
    puts 'Thats all stations list. Choose a station to view a list of all trains on it'
    @all_stations[gets.chomp.to_i - 1].trains
  end

end

#interface = Interface.new
#interface.menu
