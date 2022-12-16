class Game
        attr_reader :generatecode
        attr_accessor :code
        
  def initialize
    @generatecode = Code.new
    @code = self.generatecode.create_code
  end

  def start_game
    # Insert clock timing here. 
    welcome_message

  end

  def welcome_message
    puts "Welcome to MASTERMIND. Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

    input = gets.chomp 
    if input == "p"
      play_game
    elsif input == "i"
      instructions_message
    elsif input == "q"
      abort 
    else puts "Your response is invalid. Please provide a valid response." 
      welcome_message
    end
  end 

  def instructions_message
    puts  "There are four colors- (r)ed, (g)reen, (b)lue, and (y)ellow, and four slots. You have to guess the color and order of each of the slots. Each time, you will be told how many colors are correct and how many of those colors are in the correct positions."
    "There are four colors- (r)ed, (g)reen, (b)lue, and (y)ellow, and four slots. You have to guess the color and order of each of the slots. Each time, you will be told how many colors are correct and how many of those colors are in the correct positions."
  end

  def play_game 
    new_turn = Turn.new(self)
    new_turn.turn_helper
  end
  #array that we are passing through- from the user input 
  def check_winner_helper(array)

    check_ind_letter(array[0], 0)
    check_ind_letter(array[1], 1)
    check_ind_letter(array[2], 2)
    check_ind_letter(array[3], 3)

    next_turn = Turn.new(self)
    next_turn.turn_helper

  end
# element is the user input; index_number will be used to reference the correct one in the master code
def check_ind_letter(element, index_number)

hash_of_results = Hash.new(0)
require 'pry'; binding.pry
  to_check = @code[index_number] #this is the master code 

  if element == @code[index_number]
    "Correct letter, correct location"
    hash_of_results["Correct Letter, Correct Location"] += 1

  elsif @code.include?(element) == true
    "Correct letter, wrong location"
    hash_of_results["Correct_Letter_Wrong_Location"] += 1

  elsif @code.include?(element) == false 
    "Wrong letter, wrong location"
    hash_of_results["Wrong_Letter_Wrong_Location"] += 1

  end 

end
end 