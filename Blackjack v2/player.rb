# frozen_string_literal: true

class Player
  attr_reader :name, :hand
  attr_accessor :bankroll

  def initialize(name)
    @bankroll = 100
    @name = name.to_s
    @hand = Hand.new
  end

  def turn(main, choice)
    case choice
    when 1
      main.dealer.turn(main)
    when 2
      main.open_cards
    when 3
      main.dealer.deals_cards(main, self) if @hand.cards.length < 3
      main.dealer.turn(main)
    end
  end
end
