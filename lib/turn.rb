class Turn
        attr_reader :guess_input
  def initialize(game)
    @guess_input = nil 
    @game = game 
  end

  def turn_helper
    request_human_input
        guess_input = @guess_input 
    convert_to_array_of_symbols(guess_input)   
    @game.check_winner_helper(@array_to_check)   
  end

  def request_human_input 
   
    # puts "Please provide your guess."

    # @guess_input = gets.chomp

    @guess_input = "rrbb"  
         
  end

  def convert_to_array_of_symbols(guess_input)
    array = guess_input.split("") 
    @array_to_check = array.map do |inditem|
      inditem.to_sym
    end
    return @array_to_check 
  end

end