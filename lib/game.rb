class Game
            attr_accessor :code, :array
        
  def initialize
    @generatecode = Code.new
    @code = @generatecode.create_code
    @hash_of_results = Hash.new(0)
    @array = nil 
  end

  def start_game
    # Insert clock timing here. 
    welcome_message
  end

  def code_dup 
    @dupcode = @code.dup
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

  def establish_victor
    if @hash_of_results["Correct Letter, Correct Location"] == 4 
      true
      @hash_of_results.clear
      victory_message
      welcome_message
    end 
  end

  def victory_message
    puts "Mabrouk! You have won the game."
  end


  def check_winner_helper(array)
    @array = array
    code_dup
    check_letters_helper
    establish_victor
    if establish_victor != true
      print_results
      @hash_of_results.clear
      @code = @dupcode
      next_turn = Turn.new(self)
      next_turn.turn_helper
    else 
      welcome_message
    end 
  end

  def check_letters_helper 
    check_ind_letter_match(@array[0], 0)
    check_ind_letter_match(@array[1], 1)
    check_ind_letter_match(@array[2], 2)
    check_ind_letter_match(@array[3], 3)
    check_ind_letter_similar(@array[0], 0)
    check_ind_letter_similar(@array[1], 1)
    check_ind_letter_similar(@array[2], 2)
    check_ind_letter_similar(@array[3], 3)
    return @hash_of_results
  end

  def check_ind_letter_match(element, index_number)
    if element == @code[index_number]
      "Correct letter, correct location"
      @hash_of_results["Correct Letter, Correct Location"] += 1
      @code.delete_at(index_number)
      @code.insert(index_number, nil)
      @array.delete_at(index_number)
      @array.insert(index_number, nil)
    else 
      "No Change"
    end 
    return @hash_of_results
  end 

  def check_ind_letter_similar(element, index_number)

    if element != nil && element == @code[0]  
      "Correct letter, wrong location"
      @hash_of_results["Correct Letter, Wrong Location"] += 1
      @code.replace([nil, @code[1], @code[2], @code[3]])

    elsif element != nil && element == @code[1]
      "Correct letter, wrong location"
      @hash_of_results["Correct Letter, Wrong Location"] += 1
      @code.replace([@code[0], nil, @code[2], @code[3]])

    elsif element != nil && element == @code[2]
      "Correct letter, wrong location"
      @hash_of_results["Correct Letter, Wrong Location"] += 1
      @code.replace([@code[0], @code[1], nil, @code[3]])

    elsif element != nil && element == @code[3]
      "Correct letter, wrong location"
      @hash_of_results["Correct Letter, Wrong Location"] += 1
      @code.replace([@code[0], @code[1], @code[2], nil])

    elsif @code.include?(element) == false 
      "Wrong letter, wrong location"
      @hash_of_results["Wrong Letter, Wrong Location"] += 1
    end 

      return @hash_of_results

  end

  def print_results
    puts "Not quite! You have #{@hash_of_results["Correct Letter, Correct Location"]} correct letters in the correct location and #{@hash_of_results["Correct Letter, Wrong Location"]} correct letters in the wrong location. 

    Try again!"
    "Not quite! You have #{@hash_of_results["Correct Letter, Correct Location"]} correct letters in the correct location and #{@hash_of_results["Correct Letter, Wrong Location"]} correct letters in the wrong location. 

    Try again!"
  end

end 