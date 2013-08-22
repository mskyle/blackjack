# encoding: UTF-8
class Deck

  SUITS = ['♠', '♣', '♥', '♦']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def initialize
    @deck = []

    SUITS.each do |suit|
      VALUES.each do |value|
        @deck.push(value + suit)
      end
    end

    @deck.shuffle!
  end

  # Rather than exposing our internal array, let's just define a `next_card` method
  # that returns the top card from the deck.
  def next_card
    @deck.pop
  end

end
