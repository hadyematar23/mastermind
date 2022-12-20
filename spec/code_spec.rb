require './lib/game'
require './lib/turn'
require './lib/code'

RSpec.describe Code do
  context "happpy paths" do
  
  it "that game creates a code" do 

    @generatecode = Code.new
    expect(@generatecode).to be_an_instance_of(Code)
  
  end 


  it "creates a random code made up of r,g,b and y" do 

    generatecode = Code.new
    generatecode.create_code

    expect(generatecode.create_code.count).to eq(4)
  
  end 
end 
end 
