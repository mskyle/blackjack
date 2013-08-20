#!/usr/bin/env ruby
# encoding: UTF-8

require './player.rb'
require './deck.rb'
require './game.rb'

my_deck = Deck.new

game = Game.new(my_deck)

game.play_the_game







