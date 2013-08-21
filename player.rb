class Player
  def initialize(name)
    @hand = []
    @name = name
    @bust = false
  end

  attr_accessor :hand, :name, :bust

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

  def display
    puts @hand_array
  end
end
