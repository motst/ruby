# frozen_string_literal: true

require_relative 'interface'
require_relative 'deck'
require_relative 'card'
require_relative 'dealer'
require_relative 'player'
require_relative 'hand'

class Main
  BET = 10

  attr_reader :deck, :dealer, :player, :interface
  attr_accessor :game_bankroll

  def initialize
    @game_bankroll = 0
    @deck = Deck.new
    @deck.filling
    @dealer = Dealer.new
    @interface = Interface.new
    interface.name_request(self)
  end

  def new_player(name)
    @player = Player.new(name)
    start
  end

  def start
    @dealer.shuffle_cards(self)
    2.times { @dealer.deals_cards(self, @dealer) }
    2.times { @dealer.deals_cards(self, @player) }
    total_bankroll('fund')
    menu
  end

  def menu
    open_cards if @dealer.hand.cards.length == 3 && @player.hand.cards.length == 3
    @player.hand.scoring_points
    @player.hand.for_string
    @interface.player_menu(self, @dealer.hand.cards.length, @player.hand.cards.length, @player.hand.cards_to_s,
                           @player.hand.points)
  end

  def open_cards
    @dealer.hand.scoring_points
    @player.hand.scoring_points
    @dealer.hand.for_string
    @player.hand.for_string
    interface.open_cards_report(@dealer.hand.cards_to_s, @dealer.hand.points, @player.hand.cards_to_s,
                                @player.hand.points)
    results
  end

  def results
    win_pay(@player) if @player.hand.points <= 21 && @player.hand.points > @dealer.hand.points
    win_pay(@player) if @dealer.hand.points > 21 && @dealer.hand.points != @player.hand.points
    win_pay(@dealer) if @player.hand.points > 21 && @player.hand.points != @dealer.hand.points
    win_pay(@dealer) if @dealer.hand.points <= 21 && @dealer.hand.points > @player.hand.points
    total_bankroll('refund') if @player.hand.points == @dealer.hand.points
    interface.play_again_request(self)
  end

  def win_pay(participant)
    participant.bankroll += BET * 2
    @game_bankroll -= BET * 2
    interface.bankrolls_report(@dealer.bankroll, @player.bankroll, @game_bankroll)
  end

  def total_bankroll(action)
    multiplier = -1 if action == 'fund'
    multiplier = 1 if action == 'refund'
    @player.bankroll += BET * multiplier
    @dealer.bankroll += BET * multiplier
    @game_bankroll -= BET * 2 * multiplier
    interface.bankrolls_report(@dealer.bankroll, @player.bankroll, @game_bankroll)
  end

  def play_again?(choice)
    case choice
    when 1
      @deck.cards.zip(@dealer.hand.cards, @player.hand.cards).flatten!
      @dealer.hand.cards = []
      @player.hand.cards = []
      @dealer.hand.cards_to_s = []
      @player.hand.cards_to_s = []
      start
    when 2
      exit
    end
  end
end
