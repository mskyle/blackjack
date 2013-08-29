class Game
  def initialize(deck, player, dealer)
    @deck = deck
    @player = player
    @dealer = dealer
  end

  def initial_deal
    puts
    puts "* * * * * * * Welcome to BLACKJACK !!! * * * * * * * "
    2.times do
      @player.hit
      @dealer.hit
    end
  end

  def end_turn
    puts ""
    puts "**************** END TURN *****************"
    puts ""
  end

  def player_turn
    puts
    puts "*************** #{@player.name}'s turn ************"
    output_scores
    puts "Hit or stay? H/S"
    input = gets.chomp
    if @player.hand_score == 21
      puts "Blackjack!!"
      end_turn
    elsif @player.hand_score > 21
      puts "Busted!!"
      @player.is_bust
      end_turn
    else
      if input == "H"
        @player.hit
        player_turn
      else
        puts "Your turn is over your score is #{@player.hand_score}"
        end_turn
      end
    end
  end

  def output_scores
    puts "dealer score is #{@dealer.hand_score}"
    puts "player score is #{@player.hand_score}"
  end

  def dealer_turn
    output_scores
    if @dealer.hand_score == 21
      puts "Dealer has 21"
      end_turn
    elsif @dealer.hand_score > 21
      puts "Dealer busts"
      @dealer.is_bust
      end_turn
    else
      if @dealer.hand_score < 17
        @dealer.hit
        dealer_turn
      end
    end
  end

  def find_winners
    puts "Dealer has #{@dealer.hand_score}"
    puts ""
    if @dealer.bust
      if @player.bust
        puts "player wins with #{@player.hand_score}"
      else
        puts "dealer ties with #{@dealer.hand_score}"
      end

    else
      if @player.bust
        puts "Sorry, player, you lose with #{@player.hand_score}."
      elsif @player.hand_score > @dealer.hand_score
        puts "player wins with #{@player.hand_score}"
      elsif @player.hand_score == @dealer.hand_score
        puts "player ties with #{@player.hand_score}"
      else
        puts "Sorry, player, you lose with #{@player.hand_score}."
      end
    end
  end

  def play_game
    initial_deal
    player_turn
    dealer_turn
    find_winners
  end
end