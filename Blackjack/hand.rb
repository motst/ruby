# frozen_string_literal: true

class Hand
  attr_reader :name
  attr_accessor :bankroll, :cards, :points

  def initialize(name)
    @bankroll = 100
    @cards = {}
    @name = name.to_s
  end

  def scoring_points
    @points = if @cards.values.sum > 21 && @cards.value?(11)
                @cards.values.sum - 10
              else
                @cards.values.sum
              end
  end
end
