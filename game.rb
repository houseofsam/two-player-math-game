class Game
  attr_reader :players
  attr_accessor :turn

  def initialize(player1, player2)
    @players = [player1, player2]
    @player1 = player1
    @player2 = player2
    @turn = player1
    @game_over = false
    @loser = nil
    @winner = nil
  end

  def generate_question 
    until @game_over == true
      random_num1 = rand(20)
      random_num2 = rand(20)
      question_answer = random_num1 + random_num2

      puts "----- NEW TURN -----"
      print "#{turn.name}, What is #{random_num1} plus #{random_num2}?: "
      player_answer = gets.chomp.to_i

      if player_answer == question_answer
        puts "Yes, that is correct!"
        puts "#{@player1.name}: #{@player1.lives}/3 vs. #{@player2.name}: #{@player2.lives}/3"
      else
        puts "Wrong!! You lose a life!"
        turn.lose_life
        puts "#{@player1.name}: #{@player1.lives}/3 vs. #{@player2.name}: #{@player2.lives}/3"
      end

      self.turn = turn == @player1 ? @player2 : @player1
      self.check_player_lives
    end
  end

  def check_player_lives
    players.each do |player|
      if player.lives == 0
        @loser = player
        self.game_over
      end
    end
  end

  def game_over
    players.each do |player|
      if player != @loser
        @winner = player
        puts "----- FINAL SCORE -----"
        puts "#{@winner.name} wins with a score of #{@winner.lives}/3"
        puts "----- GAME OVER -----"
        @game_over = true
      end
    end
  end

end