#!/usr/bin/env ruby
# encoding: UTF-8

require './player.rb'
require './deck.rb'
require './game.rb'

# def score(hand)
#   score = 0
#   values = []
#   hand.each { |card| values << card.chop }
#   # if values.include?"A"
#   #   puts "Shit! An ace!"
#   # else
#     values.each do |value|
#       if value.to_i > 0
#         score += value.to_i
#       else
#         score += 10
#       end
#     # end
#   end
#   return score
# end

my_deck = Deck.new



game = Game.new(my_deck)

game.add_players

game.players.each { |player| puts player.name }

game.initial_deal

game.players.each { |player| puts player.hand.inspect }

game.players.each { |player| game.turn(player) }

game.dealer_turn

game.find_winners



