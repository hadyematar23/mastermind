class Turn
        attr_accessor :guess_input
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
   
    puts "Please provide your guess."

    @guess_input = gets.chomp

    @guess_input = @guess_input.downcase
    if @guess_input.length > 4 
      puts "Too many characters! Enter only 4"
      request_human_input 
    elsif @guess_input.length < 4 
      puts "Not enough characters!"
      request_human_input 
    elsif @guess_input.match?(/\A[rgby]+\z/) == false 
      puts "You can only input the characters 'r', 'g', 'b' and 'y' . Plase try again."
      request_human_input
    elsif @guess_input == "EXIT"
      abort 
    end
         
  end

  def convert_to_array_of_symbols(guess_input)
    array = guess_input.split("") 
    @array_to_check = array.map do |inditem|
      inditem.to_sym
    end
    return @array_to_check 
  end

end