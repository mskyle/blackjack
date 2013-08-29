class Deck

  SUITS = ['♠', '♣', '♥', '♦']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  attr_accessor :deck

  def initialize
    @deck = []

    SUITS.each do |suit|
      VALUES.each do |value|

        @deck.push(Card.new(suit, value))
      end
    end
    @deck.shuffle!
  end

  def pop
    @deck.pop
  end
end