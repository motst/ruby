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
      puts 'Enter 1 to add a station to the route'
      puts 'Enter 2 to remove a station from the route'
      puts 'Enter 3 to assign a route for the train'
      puts 'Enter 4 to attach a wagon to the train'
      puts 'Enter 5 to dettach a wagon from the train'
      puts 'Enter 6 to send the train forward'
      puts 'Enter 7 to send the train back'
        case gets.chomp.to_i
        when 1
          railroad.list(railroad.all_stations)
          puts 'Choose the station to add to the route'
          station = railroad.all_stations[gets.chomp.to_i - 1]
          railroad.list(railroad.all_routes)
          puts 'Choose the route you want to add the selected station to'
          route = railroad.all_routes[gets.chomp.to_i - 1]
          route.add(station)
        when 2
          railroad.list(railroad.all_stations)
          puts 'Choose the station to remove from the route'
          station = railroad.all_stations[gets.chomp.to_i - 1]
          railroad.list(railroad.all_routes)
          puts 'Choose the route you want to remove the selected station from'
          route = railroad.all_routes[gets.chomp.to_i - 1]
          route.remove(station)
        when 3
          railroad.list(railroad.all_trains)
          puts 'Choose the train to assign the route to'
          train = railroad.all_trains[gets.chomp.to_i - 1]
          railroad.list(railroad.all_routes)
          puts 'Choose the route you want to assign to the selected train'
          route = railroad.all_routes[gets.chomp.to_i - 1]
          train.purpose(route)
        when 4
          railroad.list(railroad.all_wagons)
          puts 'Choose the wagon to add to the train'
          wagon = railroad.all_wagons[gets.chomp.to_i - 1]
          railroad.list(railroad.all_trains)
          puts 'Choose the train to which you want to add the selected wagon'
          train = railroad.all_trains[gets.chomp.to_i - 1]
          train.attach(wagon)
        when 5
          railroad.list(railroad.all_wagons)
          puts 'Choose the wagon to detach from the train'
          wagon = railroad.all_wagons[gets.chomp.to_i - 1]
          railroad.list(railroad.all_trains)
          puts 'Choose the train from which you want to detach the selected wagon'
          train = railroad.all_trains[gets.chomp.to_i - 1]
          train.detach(wagon)
        when 6
          railroad.list(railroad.all_trains)
          puts 'Choose the train to send forward'
          train = railroad.all_trains[gets.chomp.to_i - 1]
          railroad.list(railroad.all_routes)
          puts 'Choose the route you want to send the train to'
          route = railroad.all_routes[gets.chomp.to_i - 1]
          train.forward(route)
        when 7
          railroad.list(railroad.all_trains)
          puts 'Choose the train to send back'
          train = railroad.all_trains[gets.chomp.to_i - 1]
          railroad.list(railroad.all_routes)
          puts 'Choose the route you want to send the train to'
          route = railroad.all_routes[gets.chomp.to_i - 1]
          train.back(route)
        end
    when 3
      railroad.list(railroad.all_stations)
      puts 'Thats all stations list. Choose a station to view a list of all trains on it'
      railroad.all_stations[gets.chomp.to_i - 1].trains
    end
end
