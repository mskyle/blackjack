class Player
  def initialize(name)
    @hand = []
    @name = name
    @bust = false
  end

  attr_accessor :hand, :name, :bust

  def hit?
    while true
      print "Do you want to hit or stand? h or s? "
      input = gets.chomp
      if input.downcase == "h"
        return true
      elsif input.downcase == "s"
        return false
      else
        puts "I'm sorry, that's not a valid input."
      end
    end
  end

  def display
    puts "#{name} has:"
    puts @hand * " "
    puts "#{name}'s score is #{score}"
    puts ""
  end

  def score
    score = 0
    values = []
    @hand.each { |card| values << card.chop }
    values.each do |value|
      if value.to_i > 0
        score += value.to_i
      else
        if value == "A"
          score += 1
        else
          score += 10
        end
      end
    end
    if values.include?("A") && score <= 11
      score += 10
    end
    return score
  end

end
