# frozen_string_literal: true

class Dealer < Hand
  def shuffle_cards
    shuffled = $main.deck.cards.to_a.shuffle.flatten(1)
    $main.deck.cards.replace(Hash[*shuffled])
  end

  def deals_cards(participant)
    top_card = $main.deck.cards.to_a.last
    participant.cards.merge!(Hash[*top_card])
    $main.deck.cards.delete_if { |value, _points| value == top_card[0] }
  end

  def turn
    $main.open_cards if $main.player.cards.length == 3 && cards.length == 3
    scoring_points
    if @points >= 17
      $main.menu
    elsif @points < 17
      deals_cards(self) if @cards.length < 3
      $main.menu
    end
  end
end
