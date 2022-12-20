class Code
        attr_reader :final_code

  def create_code 
    @final_code = []

    4.times do 
      @final_code << [[:r],[:y],[:b],[:g]].sample
    end 

    @final_code = @final_code.flatten
    
  end

end