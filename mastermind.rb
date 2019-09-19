class Mastermind
    @@round_count
    def initialize
        @player = Player.new("Player1")
        @computer = Computer.new
        @@round_count = 0
    end
    def play
        @player.change_name
        print "Hello #{@player.name}! Let's play Mastermind\n"
        @computer.generate_code
        #loop do 
            @player.guess
            #break if won || too_many_guesses
        #end
    end
end

class Player
    attr_accessor :name
    def initialize(name)
        @name = name 
    end

    def change_name
        print "Please enter your name:\n"
        name_input = gets.chomp
        @name = name_input
    end

    def guess
        print "Enter your guess for the 4 colors:\n"
        player_guess = gets.chomp
        guess = to_correct_array(player_guess)
    end

    def to_correct_array(player_guess)
        array = player_guess.split(",").to_a
        if array.length != 4 
            print "Wrong number of inputs! Enter 4 colors seperated by commas:\n"
            player_guess = gets.chomp
            to_correct_array(player_guess)
        end
        array.length.times {|i| array[i] = array[i].capitalize}
        print array
        array.length.times do |i|
            if array[i] != "Red" || array[i] != "Green" || array[i] != "Blue" || array[i] != "Purple" || array[i] != "Orange" || array[i] != "Black" || array[i] != "White" || array[i] != "Yellow"
                print "Wrong color selected in input. Please only select from RGBPOBW:\n"
                player_guess = gets.chomp
                to_correct_array(player_guess)
            end
        end
        return array
    end
end

class Computer
    def initialize

    end
    def generate_code
        code = []
        4.times {|i| code[i] = rand(1..8)}
        code.length.times do |i|
            if code[i] == 1
                code[i] = "Red"
            elsif code[i] == 2 
                code [i] = "Green" 
            elsif code[i] == 3
                code [i] = "Blue"  
            elsif code[i] == 4
                code [i] = "Yellow" 
            elsif code[i] == 5
                code [i] = "Purple"  
            elsif code[i] == 6
                code [i] = "Orange"  
            elsif code[i] == 7
                code [i] = "Black" 
            else
                code [i] = "White" 
            end  
        end
    end
end

game = Mastermind.new
game.play