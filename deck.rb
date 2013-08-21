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

  def deal(hand)
    card = @deck.pop
    hand << card
    puts "#{card} is dealt"
  end

end
