# frozen_string_literal: true

class Interface
  BET = 10

  attr_accessor :deck, :dealer, :player, :game_bankroll

  def initialize
    @game_bankroll = 0
    @deck = Card.new
    @dealer = Dealer.new('Dealer')
  end

  def new_player
    puts 'Enter your name'
    @player = Player.new(gets.chomp)
    start
  end

  def start
    @dealer.shuffle_cards
    2.times { @dealer.deals_cards(@dealer) }
    2.times { @dealer.deals_cards(@player) }
    total_bankroll('fund')
    menu
  end

  def menu
    open_cards if @dealer.cards.length == 3 && @player.cards.length == 3
    @player.scoring_points
    print "Dealer's cards: {** => **"
    print ', ** => **' * (@dealer.cards.length - 1)
    puts '}, total points: **'
    puts "Player's cards: #{@player.cards}, total points: #{@player.points}"
    puts '______________________________________________________'
    puts '1 to skip'
    puts '2 to open cards'
    puts '3 to add card' if @player.cards.length < 3
    player.turn(gets.chomp.to_i)
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
    total_bankroll('refund') if @player.points == @dealer.points
    play_again?
  end

  def win_pay(participant)
    participant.bankroll += BET * 2
    @game_bankroll -= BET * 2
    bankrolls_report
  end

  def total_bankroll(action)
    multiplier = -1 if action == 'fund'
    multiplier = 1 if action == 'refund'
    @player.bankroll += BET * multiplier
    @dealer.bankroll += BET * multiplier
    @game_bankroll -= BET * 2 * multiplier
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
