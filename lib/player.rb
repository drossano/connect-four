class Player
  def input(array)
    loop do
      min = 1
      max = array.length
      input = gets.chomp.to_i
      if input.between?(min, max)
        return input
      else 
        puts "Invalid input. Please enter a number between #{min} and #{max}."
      end   
    end
  end
end