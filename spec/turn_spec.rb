require './lib/game'
require './lib/turn'
require './lib/code'

RSpec.describe Turn do
  context "happpy paths" do
  before(:each) do 
    @mastermind = Game.new
    @new_turn = Turn.new(@mastermind)

  end 

  it "is an instance of the Turn class" do 

    expect(@new_turn).to be_an_instance_of(Turn)

  end 

  it "checks each one of the elements of the arrary" do 
    
    @new_turn.guess_input = "rrbb"
    expect(@new_turn.turn_helper).to eq([:r, :r, :b, :b])

  end 

  it "checks each one of the elements of the arrary" do 

  
    expect(@new_turn.turn_helper).to eq([:r, :r, :b, :b])

  end 



  end
end 