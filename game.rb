class Game

  def initialize(deck)
    @players = []
    @deck = deck
    @dealer = Player.new("Dealer")
  end

  def players
    @players
  end

  def add_players
    while @players.length < 2
      puts "If you want to play, type your name"
      name = gets.chomp
      unless name == ""
        player = Player.new(name)
        @players << player
      end
    end
  end

  def initial_deal
    2.times do
      @players.each do |player|
        @deck.deal(player.hand)
      end
      @deck.deal(@dealer.hand)
    end
  end

  def turn(player)
    puts player.hand.inspect
    puts "#{player.name}, your score is #{score(player.hand)}"
    if score(player.hand) == 21
      puts "you have 21"
    elsif score(player.hand) > 21
      puts "you bust"  
      player.bust
    else
      if player.hit?
        @deck.deal(player.hand)
        turn(player)
      else
        puts "your turn is over your score is #{score(player.hand)}" 
      end
    end
  end

  def dealer_turn
    puts @dealer.hand.inspect
    puts "Dealer's score is #{score(@dealer.hand)}"
    if score(@dealer.hand) == 21
      puts "Dealers has 21"
    elsif score(@dealer.hand) > 21
      puts "Dealer busts"  
      @dealer.bust
    else
      if score(@dealer.hand) < 17
        @deck.deal(@dealer.hand)
        dealer_turn
      end
    end
  end

  def score(hand)
    score = 0
    values = []
    hand.each { |card| values << card.chop }
    # if values.include?"A"
    #   puts "Shit! An ace!"
    # else
      values.each do |value|
        if value.to_i > 0
          score += value.to_i
        else
          score += 10
        end
      # end
    end
    return score
  end

  def find_winners
    if @dealer.is_bust?
      puts "everybody wins!"
    else
      @players.each do |player|
        if player.is_bust?
          puts "Sorry, #{player.name}, you lose."
        elsif score(player.hand) > score(@dealer.hand)
          puts "#{player.name} wins"
        elsif score(player.hand) == score(@dealer.hand)
          puts "pushes"
        else
          puts "Sorry, #{player.name}, you lose."
        end
      end
    end
  end

  

end
