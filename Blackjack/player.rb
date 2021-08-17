# frozen_string_literal: true

class Player < Hand
  def turn(choice)
    case choice
    when 1
      $main.dealer.turn
    when 2
      $main.open_cards
    when 3
      $main.dealer.deals_cards(self) if @cards.length < 3
      $main.dealer.turn
    end
  end
end
