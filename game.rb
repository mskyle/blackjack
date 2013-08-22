class Game

  def initialize(deck)
    @players = []
    @deck = deck
    @dealer = Player.new("Dealer")
  end

  # attr_reader will create the `players` method that returns @players
  attr_reader :players

  def add_players
    # Some issues here:
    # If the user types 'play' as the first name the game starts with 0 players
    # Once you reach 4 players, it stills ends with a prompt for the next player
    # The game accepts blank strings as names

    # Possible solution:

    print "Welcome, players! "

    while @players.empty?
      print "Type your name to play: "
      add_player(gets.strip) # `strip` removes whitespace from start and end of string
    end

    while @players.length < 4
      puts "Next player enter your name. To start game, type 'play.'"

      input = gets.strip
      break if input == 'play'

      add_player(input)
    end
  end

  # Method validates user's name before adding them to the game
  def add_player(name)
    unless name.empty?
      @players << Player.new(name)
    else
      puts "Name cannot be blank."
    end
  end

  def deal(player)
    card = @deck.next_card
    player.hand << card
    puts "#{player.name} was dealt #{card}"
    puts # puts without arguments will output a blank newline
  end

  def initial_deal
    2.times do
      @players.each do |player|
        deal(player)
      end
      deal(@dealer)
    end
    puts "* * * * * * * * * * * * * * * * * * * * * * * * * "
    puts "*                                               *"
    puts "*                                               *"
    puts "************** Dealing cards..... ***************"
    puts "************* Let the game begin ****************"
    puts "*                                               *"
    puts "*                                               *"
    puts "* * * * * * * * * * * * * * * * * * * * * * * * * "
  end

  def turn(player)
    puts "*************** #{player.name}'s turn ************"
    @dealer.display
    player.display
    if player.score == 21
      puts "Blackjack!!"
      end_turn
    elsif player.score > 21
      puts "Busted!!"
      player.bust = true
      end_turn
    else
      if player.hit?
        deal(player)
        turn(player) # Recursion!!!!!!! :)
      else
        puts "Your turn is over your score is #{player.score}"
        end_turn
      end
    end
  end

  def end_turn
    puts
    puts "**************** END TURN *****************"
    puts
  end

  def dealer_turn
    @dealer.display
    if @dealer.score == 21
      puts "Dealer has 21"
      end_turn
    elsif @dealer.score > 21
      puts "Dealer busts"
      @dealer.bust = true
      end_turn
    else
      if @dealer.score < 17
        deal(@dealer)
        dealer_turn
      end
    end
  end



  def find_winners
    puts "Dealer has #{@dealer.score}"
    puts

    if @dealer.bust
      @players.each do |player|
        unless player.bust
          puts "#{player.name} wins with #{player.score}"
        else
          puts "#{player.name} ties with #{player.score}"
        end
      end
    else
      @players.each do |player|
        if player.bust
          puts "Sorry, #{player.name}, you lose with #{player.score}."
        elsif player.score > @dealer.score
          puts "#{player.name} wins with #{player.score}"
        elsif player.score == @dealer.score
          puts "#{player.name} ties with #{player.score}"
        else
          puts "Sorry, #{player.name}, you lose with #{player.score}."
        end
      end
    end
  end

  def play_the_game
    puts "Welcome to Blackjack at the Broken Toy Casino!"
    add_players
    initial_deal
    players.each { |player| player.display }
    @dealer.display
    players.each { |player| turn(player) }
    dealer_turn
    find_winners
  end

end
