# frozen_string_literal: true

require_relative 'interface'
require_relative 'card'
require_relative 'hand'
require_relative 'dealer'
require_relative 'player'

$main = Interface.new
$main.new_player
