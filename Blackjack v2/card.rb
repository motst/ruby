# frozen_string_literal: true

class Card
  attr_reader :rank, :suit, :points

  def initialize(rank, suit, points)
    @rank = rank
    @suit = suit
    @points = points
  end
end
