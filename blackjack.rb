#!/usr/bin/env ruby
# encoding: UTF-8


require './deck.rb'
require './game.rb'
require './card.rb'
require './hand.rb'

my_deck = Deck.new
player_hand = Hand.new("player", my_deck)
dealer_hand = Hand.new("dealer", my_deck)

game = Game.new(my_deck, player_hand, dealer_hand)
game.play_game