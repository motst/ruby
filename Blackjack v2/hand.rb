# frozen_string_literal: true

class Hand
  attr_accessor :cards, :cards_to_s, :points

  def initialize
    @cards = []
    @points = 0
    @cards_to_s = []
  end

  def scoring_points
    @points = @cards.sum(&:points)
    @points -= 10 if @points > 21 && @cards.find { |card| card.rank == 'A' }
  end

  def for_string
    @cards.each do |card|
      card_to_s = [card.rank.to_s, card.suit]
      @cards_to_s << card_to_s unless @cards_to_s.include?(card_to_s)
    end
  end
end
