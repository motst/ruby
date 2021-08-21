# frozen_string_literal: true

class Interface
  def name_request(main)
    puts 'Enter your name'
    main.new_player(gets.chomp)
  end

  def player_menu(main, dealer_cards_quantity, player_cards_quantity, player_cards, player_points)
    print "Dealer's cards: [**"
    print ', **' * (dealer_cards_quantity - 1)
    puts ']'
    puts "Player's cards: #{player_cards}, total points: #{player_points}"
    puts '______________________________________________________'
    puts '1 to skip'
    puts '2 to open cards'
    puts '3 to add card' if player_cards_quantity < 3
    main.player.turn(main, gets.chomp.to_i)
  end

  def open_cards_report(dealer_cards, dealer_points, player_cards, player_points)
    puts "Dealer's cards: #{dealer_cards}, total points: #{dealer_points}"
    puts "Player's cards: #{player_cards}, total points: #{player_points}"
  end

  def bankrolls_report(dealer_bankroll, player_bankroll, game_bankroll)
    puts "Dealer's bankroll: #{dealer_bankroll}"
    puts "Player's bankroll: #{player_bankroll}"
    puts "Game's bankroll: #{game_bankroll}"
  end

  def play_again_request(main)
    puts 'Do you want to play again?'
    puts '1 for start, 2 for exit'
    main.play_again?(gets.chomp.to_i)
  end
end
