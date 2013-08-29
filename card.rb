class Card

  attr_accessor :suit, :value, :score

  def initialize(suit, value)
    @suit = suit
    @value = value
    @score = 0

    #### caluculate score of card ####
    if value == "J" || value == "Q" || value == "K"
      @score = 10
    elsif value == "A"
      @score = 1
    else
      @score = value.to_i
    end
  end
end