# frozen_string_literal: true

class Deck
  attr_accessor :image, :cards

  def initialize
    keys = %w[2 3 4 5 6 7 8 9 10 J Q K A]
    values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
    suites = ['+', '<', '^', '<>']
    @image = keys.zip(values).to_h
    @image.clone.each do |key, value|
      suites.each do |suite|
        @image[key + suite] = value
        @image.delete(key)
      end
    end
    @cards = @image
  end
end
