# frozen_string_literal: true

module Scoring
  attr_accessor :points

  def scoring_points
    @points = if @cards.values.sum > 21 && @cards.value?(11)
                @cards.values.sum - 10
              else
                @cards.values.sum
              end
  end
end
