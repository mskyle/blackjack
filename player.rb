class Player
  def initialize(name)
    @hand_array = []
    @name = name
    @bust = false
  end

  def name
    @name
  end

  def hand
    # returns hand
    @hand_array
  end

  def bust
    @bust = true
  end

  def is_bust?
    @bust
  end

  def hit?
    while true
      puts "Do you want to hit or stand? h or s?"
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


end