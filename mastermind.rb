module Rand
    def random_color
        random_number = rand(1..8)
            if random_number == 1
                random_color = "Red"
            elsif random_number == 2 
                random_color = "Green" 
            elsif random_number == 3
                random_color = "Blue"  
            elsif random_number == 4
                random_color = "Yellow" 
            elsif random_number == 5
                random_color = "Purple"  
            elsif random_number == 6
                random_color = "Orange"  
            elsif random_number == 7
                random_color = "Black" 
            else
                random_color = "White" 
            end  
        return random_color
    end
end


class Mastermind
    @@round_count
    def initialize
        @computer = Computer.new
        @player = Player.new("Player1",@computer,@current_guess)
        @@round_count = 0
    end
    def play
        @player.change_name
        print "Hello #{@player.name}! Let's play Mastermind\n"
        @computer.computer_code
        loop do 
            @player.guess
            @@round_count += 1
            break if game_won || too_many_guesses
        end
    end

    def game_won
        if @computer.analyze_guess(@player.current_guess) == true
          print "You won!"
          return true 
        end
    end

    def too_many_guesses
        if @@round_count == 12
          print "Too many guesses! You lost!"
          print @computer.computer_code

          return true 
        end
    end
end

class Player
    attr_accessor :name, :current_guess
    def initialize(name,computer,current_guess)
        @name = name
        @computer = computer
        @current_guess = current_guess 
    end

    def change_name
        print "Please enter your name:\n"
        name_input = gets.chomp
        @name = name_input
    end

    def guess
        print "Enter your guess for the 4 colors:\n"
        player_input = gets.chomp
        guess = to_correct_array(player_input)
        @computer.analyze_guess(guess)
        @current_guess = guess
    end

    def to_correct_array(player_guess)
        array = player_guess.split(",").to_a
        if array.length != 4 
            print "Wrong number of inputs! Enter 4 colors seperated by commas:\n"
            player_guess = gets.chomp
            to_correct_array(player_guess)
        end
        array.length.times {|i| array[i] = array[i].capitalize}
        array.length.times do |i|
            if array[i] != "Red" && array[i] != "Green" && array[i] != "Blue" && array[i] != "Purple" && array[i] != "Orange" && array[i] != "Black" && array[i] != "White" && array[i] != "Yellow"
                print "Wrong color selected in input. Please only select from RGBPOBW:\n"
                player_guess = gets.chomp
                to_correct_array(player_guess)
            end
        end
        return array
    end
end

class Computer
    include Rand
    attr_accessor :computer_code
    def initialize
        color_1 = random_color
        color_2 = random_color
        color_3 = random_color
        color_4 = random_color
        @computer_code = [color_1,color_2,color_3,color_4]
    end
    def computer_code
        return @computer_code
    end

    def analyze_guess(guess)
        return_array = []
        guess.length.times do |i|
            if guess[i] == @computer_code[i]
                return_array[i] = "True"
            else
              return_array[i] = "False"
            end
        end
        return true if return_array.all? {|index| index == "True"}
        any_color_correct?(guess)
        any_position_correct?(guess)
    end

    def any_color_correct?(guess)
        i_unique = nil
        color_counter = 0 
        @computer_code.length.times do |i|
            guess.length.times do |j|
                if @computer_code[i] == guess[j]
                    if i_unique == nil || i_unique != i
                        i_unique = i
                        color_counter += 1
                    end
                end
                if color_counter > 4
                    color_counter = 4
                end
            end
        end
        print "You have #{color_counter} colors correct\n"  
    end

    def any_position_correct?(guess)
        position_counter = 0
        @computer_code.length.times do |i|
            guess.length.times do |j|
                if @computer_code[i] == guess[j] && i == j
                    position_counter += 1
                end
            end
        end  
        print "You have #{position_counter} colors in the correct position\n"      
        end
    end

game = Mastermind.new
game.play