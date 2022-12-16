class Code
        attr_accessor :final_code

  def create_code 
    # @final_code = []

    # 4.times do 
    #   @final_code << [[:r],[:y],[:b],[:g]].sample
    # end 

    # @final_code = @final_code.flatten

    @final_code = [[:r], [:r], [:b], [:g]].flatten
    
  end
end