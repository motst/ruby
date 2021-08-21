# frozen_string_literal: true

class Dealer
  attr_reader :hand
  attr_accessor :bankroll

  def initialize
    @bankroll = 100
    @hand = Hand.new
  end

  def shuffle_cards(main)
    main.deck.cards.shuffle!
  end

  def deals_cards(main, participant)
    participant.hand.cards << main.deck.cards[-1]
    main.deck.cards.delete_at(-1)
  end

  def turn(main)
    main.open_cards if main.player.hand.cards.length == 3 && @hand.cards.length == 3
    @hand.scoring_points
    if @hand.points >= 17
      main.menu
    elsif @hand.points < 17
      deals_cards(main, self) if @hand.cards.length < 3
      main.menu
    end
  end
end
