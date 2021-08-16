# frozen_string_literal: true

require_relative 'deck'
require_relative 'player'
require_relative 'dealer'

class Game
  BET = 10

  attr_accessor :deck, :dealer, :player, :game_bankroll

  def initialize
    @game_bankroll = 0
    @deck = Deck.new
    @dealer = Dealer.new
  end

  def new_player
    puts 'Enter your name'
    @player = Player.new(gets.chomp)
    start
  end

  def start
    @dealer.shuffle_cards(@deck)
    2.times { @dealer.deals_cards(@dealer, @deck) }
    2.times { @dealer.deals_cards(@player, @deck) }
    @player.bankroll -= BET
    @dealer.bankroll -= BET
    @game_bankroll += BET * 2
    bankrolls_report
    player.turn(self, @dealer, @deck)
  end

  def open_cards
    @dealer.scoring_points
    @player.scoring_points
    puts "Dealer's cards: #{@dealer.cards}, total points: #{@dealer.points}"
    puts "Player's cards: #{@player.cards}, total points: #{@player.points}"
    results
  end

  def results
    win_pay(@player) if @player.points <= 21 && @player.points > @dealer.points
    win_pay(@player) if @dealer.points > 21 && @dealer.points != @player.points
    win_pay(@dealer) if @player.points > 21 && @player.points != @dealer.points
    win_pay(@dealer) if @dealer.points <= 21 && @dealer.points > @player.points
    refund if @player.points == @dealer.points
    play_again?
  end

  def win_pay(participant)
    participant.bankroll += BET * 2
    @game_bankroll -= BET * 2
    bankrolls_report
  end

  def refund
    @player.bankroll += BET
    @dealer.bankroll += BET
    @game_bankroll -= BET * 2
    bankrolls_report
  end

  def bankrolls_report
    puts "Dealer's bankroll: #{@dealer.bankroll}"
    puts "Player's bankroll: #{@player.bankroll}"
    puts "Game's bankroll: #{@game_bankroll}"
  end

  def play_again?
    puts 'Do you want to play again?'
    puts '1 for start, 2 for exit'
    case gets.chomp.to_i
    when 1
      @dealer.cards = {}
      @player.cards = {}
      @deck.cards = @deck.image
      start
    when 2
      exit
    end
  end
end
