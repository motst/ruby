# frozen_string_literal: true

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def filling
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
    suits = ['+', '<3', '^', '<>']
    points = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
    ranks.each do |rank|
      suits.each do |suit|
        points = if rank.instance_of?(Integer)
                   rank
                 elsif rank.include? 'A'
                   11
                 else
                   10
                 end
        @cards << Card.new(rank, suit, points)
      end
    end
  end
end
