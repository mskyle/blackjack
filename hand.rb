class Hand

  attr_accessor :name, :hand, :bust
  def initialize(player, deck)
    @name = player
    @hand = []
    @deck = deck
    @hand_score = 0
    @bust = false
  end

  def hand_score
    @hand_score = 0
    @hand.each do |cards|
      @hand_score += cards.score
    end
    if @hand.include?("A") && @hand_score <= 11
      @hand_score += 10
    end
    @hand_score.to_i
  end

  def hit
    card = @deck.pop
    @hand << card
    puts "#{@name} was dealt #{card.suit} #{card.value}"
  end

  def is_bust
    @bust = true
  end

end