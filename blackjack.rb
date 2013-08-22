#!/usr/bin/env ruby
# encoding: UTF-8

# Can optionally use require_relative if you're including files relative to this one.
require_relative 'player'
require_relative 'deck'
require_relative 'game'

my_deck = Deck.new

game = Game.new(my_deck)

game.play_the_game

# puts my_deck.deck
