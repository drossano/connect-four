class Player
  def input(array)
    min = 1
    max = array.length
    input = gets.chomp.to_i
    if input > max
       puts "Invalid input. Please try again."
    end
  end
end