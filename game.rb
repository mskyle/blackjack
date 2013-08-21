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
    player.display
    if player.score == 21
      puts "you have 21"
    elsif player.score > 21
      puts "you bust"  
      player.bust = true
    else
      if player.hit?
        @deck.deal(player.hand)
        turn(player)
      else
        puts "your turn is over your score is #{player.score}" 
      end
    end
  end

  def dealer_turn
    @dealer.display
    if @dealer.score == 21
      puts "Dealers has 21"
    elsif @dealer.score > 21
      puts "Dealer busts"  
      @dealer.bust = true
    else
      if @dealer.score < 17
        @deck.deal(@dealer.hand)
        dealer_turn
      end
    end
  end



  def find_winners
    if @dealer.bust
      @players.each do |player|
        unless player.bust
          puts "#{player.name} wins with #{player.score}"
        else
          puts "pushes"
        end
      end
    else
      @players.each do |player|
        if player.bust
          puts "Sorry, #{player.name}, you lose with #{player.score}."
        elsif player.score > @dealer.score
          puts "#{player.name} wins"
        elsif player.score == @dealer
          puts "pushes"
        else
          puts "Sorry, #{player.name}, you lose with #{player.score}."
        end
      end
    end
  end

  def play_the_game
    add_players
    players.each { |player| puts player.name }
    initial_deal
    players.each { |player| puts player.hand.inspect }
    players.each { |player| turn(player) }
    dealer_turn
    find_winners
  end

end
