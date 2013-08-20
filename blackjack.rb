#!/usr/bin/env ruby
# encoding: UTF-8

require './player.rb'
require './deck.rb'

def score(hand)
  score = 0
  values = []
  hand.each { |card| values << card.chop }
  if values.include?"A"
    puts "Shit! An ace!"
  else
    values.each do |value|
      if value.to_i > 0
        score += value.to_i
      else
        score += 10
      end
    end
  end
  return score
end

# in case of future game with multiple players, this would be handy
def initial_deal(deck, players)
  2.times do
    players.each do |player|
      deal(player, deck)
    end
  end
end

kyle = Player.new("Kyle")

my_deck = Deck.new

2.times {my_deck.deal(kyle.hand)}




def dealer_turn(deck)
  puts player.hand.inspect
  puts score(player.hand)
  if score(player.hand) == 21
    puts "you have 21"
  elsif score(player.hand) > 21
    puts "you bust"  
  else
    if player.hit?
      deck.deal(player.hand)
      player_turn(player, deck)
    else
      puts "your turn is over your score is #{score(player.hand)}" 
    end
  end
end

player_turn(kyle, my_deck)