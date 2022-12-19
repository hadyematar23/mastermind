require './lib/game'
require './lib/code'
require './lib/turn'

RSpec.describe Game do
  context "happpy paths" do
  before(:each) do 
    
    @mastermind = Game.new
    
  end

  it "there is a game" do 

    expect(@mastermind).to be_an_instance_of(Game)

  end 

  it "that game creates a code" do 

    expect(@mastermind.generatecode).to be_an_instance_of(Code)

  end 

  it "if you request instructions you will be provided them" do 

    expect(@mastermind.instructions_message).to eq("There are four colors- (r)ed, (g)reen, (b)lue, and (y)ellow, and four slots. You have to guess the color and order of each of the slots. Each time, you will be told how many colors are correct and how many of those colors are in the correct positions.")


  end

  it "will check each element of the array and add to the hash" do 
    array = [:r, :y, :b, :g] #user input
    @mastermind.code = [:r, :r, :y, :b] #master code 
    expect(@mastermind.check_ind_letter(array[0], 0)).to eq({"Correct Letter, Correct Location" => 1
    })

  end 

  it "will check each element of the array and add to the hash" do 
    array = [:r, :y, :b, :g] #user input
    @mastermind.code = [:r, :r, :y, :b] #master code 
    @mastermind.check_ind_letter(array[0], 0)
    expect(@mastermind.check_ind_letter(array[1], 1)).to eq({"Correct Letter, Correct Location" => 1, "Correct Letter, Wrong Location" => 1})

  end 

  it "will check each element of the array" do 
    array = [:r, :y, :b, :g] #user input
    @mastermind.code = [:r, :r, :y, :b] #master code 
    @mastermind.check_ind_letter(array[0], 0)
    @mastermind.check_ind_letter(array[1], 1)
    expect(@mastermind.check_ind_letter(array[2], 2)).to eq({"Correct Letter, Correct Location" => 1, "Correct Letter, Wrong Location" => 2})

  end 

  it "will check each element of the array" do 
    array = [:r, :y, :b, :g] #user input
    @mastermind.code = [:r, :r, :y, :b] #master code 
    @mastermind.check_ind_letter(array[0], 0)
    @mastermind.check_ind_letter(array[1], 1)
    @mastermind.check_ind_letter(array[2], 2)
    expect(@mastermind.check_ind_letter(array[3], 3)).to eq({"Correct Letter, Correct Location" => 1, "Correct Letter, Wrong Location" => 2, "Wrong Letter, Wrong Location" => 1})

  end 

  # NEW SET 

  it "works with multiple different codes" do 
    array = [:y, :g, :b, :r] #user input
    @mastermind.code = [:b, :g, :r, :r] #master code 
    expect(@mastermind.check_ind_letter(array[0], 0)).to eq({"Wrong Letter, Wrong Location" => 1})
  end 

  it "works with multiple different codes" do 
    array = [:y, :g, :b, :r] #user input
    @mastermind.code = [:b, :g, :r, :r] #master code 
    @mastermind.check_ind_letter(array[0], 0)
    expect(@mastermind.check_ind_letter(array[1], 1)).to eq({"Correct Letter, Correct Location" => 1, "Wrong Letter, Wrong Location" => 1})
  end 

  it "works with multiple different codes" do 
    array = [:y, :g, :b, :r] #user input
    @mastermind.code = [:b, :g, :r, :r] #master code 
    @mastermind.check_ind_letter(array[0], 0)
    @mastermind.check_ind_letter(array[1], 1)
    expect(@mastermind.check_ind_letter(array[2], 2)).to eq({"Correct Letter, Correct Location" => 1, "Correct Letter, Wrong Location" => 1, "Wrong Letter, Wrong Location" => 1})
  end 

  it "works with multiple different codes" do 
    array = [:y, :g, :b, :r] #user input
    @mastermind.code = [:b, :g, :r, :r] #master code  
    @mastermind.check_ind_letter(array[0], 0)
    @mastermind.check_ind_letter(array[1], 1)
    @mastermind.check_ind_letter(array[2], 2)
    expect(@mastermind.check_ind_letter(array[3], 3)).to eq({"Correct Letter, Correct Location" => 2, "Correct Letter, Wrong Location" => 1, "Wrong Letter, Wrong Location" => 1})
  end 

  # NEW SET 

  it "works with multiple different codes" do 
    array = [:r, :g, :g, :y] #user input
    @mastermind.code = [:g, :r, :b, :b] #master code 
    expect(@mastermind.check_ind_letter(array[0], 0)).to eq({"Correct Letter, Wrong Location" => 1})
  end 

  it "works with multiple different codes" do 
    array = [:r, :g, :g, :y] #user input
    @mastermind.code = [:g, :r, :b, :b] #master code 
    @mastermind.check_ind_letter(array[0], 0)
    expect(@mastermind.check_ind_letter(array[1], 1)).to eq({"Correct Letter, Wrong Location" => 2})
  end 

  it "works with multiple different codes" do 
    array = [:r, :g, :g, :y] #user input
    @mastermind.code = [:g, :r, :b, :b] #master code 
    @mastermind.check_ind_letter(array[0], 0)
    @mastermind.check_ind_letter(array[1], 1)
    expect(@mastermind.check_ind_letter(array[2], 2)).to eq({"Correct Letter, Wrong Location" => 3})
  end 

  it "works with multiple different codes" do 
    array = [:r, :g, :g, :y] #user input
    @mastermind.code = [:g, :r, :b, :b] #master code 
    @mastermind.check_ind_letter(array[0], 0)
    @mastermind.check_ind_letter(array[1], 1)
    @mastermind.check_ind_letter(array[2], 2)
    expect(@mastermind.check_ind_letter(array[3], 3)).to eq({"Correct Letter, Wrong Location" => 3, "Wrong Letter, Wrong Location" => 1})
  end 

  it "will declare victory if all of the locations match" do 
    array = [:g, :r, :b, :b] #user input
    @mastermind.code = [:g, :r, :b, :b] #master code 

    expect(@mastermind.check_winner_helper([:g, :r, :b, :b])).to eq("Mabrouk! You have won the game.")

  end 


  end 
end 