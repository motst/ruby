require_relative 'seed'
require_relative 'railroad'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

def menu(railroad)
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
          puts 'Enter name of the new station'
          Station.new(railroad, gets.chomp)
        when 2
          railroad.list(railroad.all_stations)
          puts 'Choose the start point for the new route'
          start = railroad.all_stations[gets.chomp.to_i - 1]
          puts 'Choose the finish point for the new route'
          finish = railroad.all_stations[gets.chomp.to_i - 1]
          Route.new(railroad, start, finish)
        when 3
          puts 'Enter the number for the new train'
          number = gets.chomp.to_i
          puts '1: Passenger'
          puts '2: Cargo'
          puts 'Choose the type for the new train'
          gets.chomp.to_i == 1 ? PassengerTrain.new(railroad, number) : CargoTrain.new(railroad, number)
        when 4
          puts '1: Passenger'
          puts '2: Cargo'
          puts 'Choose the type for the new wagon'
          gets.chomp.to_i == 1 ? PassengerWagon.new(railroad) : CargoWagon.new(railroad)
        end
    when 2
      puts 'Enter 1 to add/remove a station to/from the route'
      puts 'Enter 2 to assign a route for the train or move train on the route'
      puts 'Enter 3 to attach/detach a wagon to/from the train'
        case gets.chomp.to_i
        when 1
          self.station(railroad)
        when 2
          self.train(railroad)
        when 3
          self.wagon(railroad)
        end
    when 3
      railroad.list(railroad.all_stations)
      puts 'Thats all stations list. Choose a station to view a list of all trains on it'
      railroad.all_stations[gets.chomp.to_i - 1].trains
    end
end

def self.station(railroad)
  railroad.list(railroad.all_stations)
  puts 'Choose the station for operation'
  station = railroad.all_stations[gets.chomp.to_i - 1]
  railroad.list(railroad.all_routes)
  puts 'Choose the route for operation'
  route = railroad.all_routes[gets.chomp.to_i - 1]
  puts 'Enter 1 to add a station to the route'
  puts 'Enter 2 to remove a station from the route'
  gets.chomp.to_i == 1 ? route.add(station) : route.remove(station)
end

def self.train(railroad)
  railroad.list(railroad.all_trains)
  puts 'Choose the train for operation'
  train = railroad.all_trains[gets.chomp.to_i - 1]
  railroad.list(railroad.all_routes)
  puts 'Choose the route for operation'
  route = railroad.all_routes[gets.chomp.to_i - 1]
  puts 'Enter 1 to assign a route for the train'
  puts 'Enter 2 to send the train forward'
  puts 'Enter 3 to send the train back'
    case gets.chomp.to_i
    when 1
      train.purpose(route)
    when 2
      train.forward(route)
    when 3
      train.back(route)
    end
end

def self.wagon(railroad)
  railroad.list(railroad.all_wagons)
  puts 'Choose the wagon for operation'
  wagon = railroad.all_wagons[gets.chomp.to_i - 1]
  railroad.list(railroad.all_trains)
  puts 'Choose the train for operation'
  train = railroad.all_trains[gets.chomp.to_i - 1]
  puts 'Enter 1 to attach a wagon to the train'
  puts 'Enter 2 to dettach a wagon from the train'
  gets.chomp.to_i == 1 ? train.attach(wagon) : train.detach(wagon)
end
