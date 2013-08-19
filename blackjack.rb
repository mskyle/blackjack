#!/usr/bin/env ruby
# encoding: UTF-8

SUITS = ['♠', '♣', '♥', '♦']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def build_deck
  deck = []

  SUITS.each do |suit|
    VALUES.each do |value|
      deck.push(value + suit)
    end
  end

  deck.shuffle
end

def deal
  # deals the next card in the deck
end

def hit_prompt
  puts "Do you want to hit or stand?"
  input = gets.chomp
  if input == "hit" 
    return true
  elsif input == "stand"
    return false
  else
    puts "I'm sorry, I didn't understand."
    hit_prompt
  end
end

def score
  # calculates the player's current score
end

def initial_deal(deck, players)
  2.times do
    players.each do |player|
      deal
    end
  end
end

players = ["you", "me", "dealer"]
deck = build_deck

hit_prompt