# frozen_string_literal: true

require_relative 'scoring'

class Player
  include Scoring

  attr_reader :name
  attr_accessor :bankroll, :cards

  def initialize(name)
    @name = name.to_s
    @bankroll = 100
    @cards = {}
  end

  def turn(game, dealer, deck)
    scoring_points
    game.open_cards if dealer.cards.length == 3 && cards.length == 3
    menu(dealer)
    case gets.chomp.to_i
    when 1
      dealer.turn(game, self, deck)
    when 2
      game.open_cards
    when 3
      dealer.deals_cards(self, deck) if @cards.length < 3
      dealer.turn(game, self, deck)
    end
  end

  def menu(dealer)
    print "Dealer's cards: {** => **"
    print ', ** => **' * (dealer.cards.length - 1)
    puts '}, total points: **'
    puts "Player's cards: #{@cards}, total points: #{@points}"
    puts '______________________________________________________'
    puts '1 to skip'
    puts '2 to open cards'
    puts '3 to add card' if @cards.length < 3
  end
end
