#!/usr/bin/env ruby
# encoding: UTF-8

require './player.rb'
require './deck.rb'
require './game.rb'

my_deck = Deck.new

game = Game.new(my_deck)

game.add_players

game.players.each { |player| puts player.name }

game.initial_deal

game.players.each { |player| puts player.hand.inspect }

game.players.each { |player| game.turn(player) }

game.dealer_turn

game.find_winners





