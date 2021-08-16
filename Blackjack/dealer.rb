# frozen_string_literal: true

require_relative 'scoring'

class Dealer
  include Scoring

  attr_accessor :bankroll, :cards

  def initialize
    @bankroll = 100
    @cards = {}
  end

  def shuffle_cards(deck)
    shuffled = deck.cards.to_a.shuffle.flatten(1)
    deck.cards.replace(Hash[*shuffled])
  end

  def deals_cards(participant, deck)
    top_card = deck.cards.to_a.last
    participant.cards.merge!(Hash[*top_card])
    deck.cards.delete_if { |value, _points| value == top_card[0] }
  end

  def turn(game, player, deck)
    scoring_points
    game.open_cards if player.cards.length == 3 && cards.length == 3
    if @points >= 17
      player.turn(game, self, deck)
    elsif @points < 17
      deals_cards(self, deck) if @cards.length < 3
      player.turn(game, self, deck)
    end
  end
end
