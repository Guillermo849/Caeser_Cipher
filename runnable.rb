require_relative 'caesar_cipher'
# Class that will ask the user for input for the cipher method of the Caesar class
# It will repite this process until the user says something other tha y(Yes)
class Runnable
  def run
    continue = true
    while continue
      puts 'Write a text to cipher'
      text = gets.chomp
      puts 'Input a number to cifer the text'
      num = gets.chomp.to_i
      puts Caesar.new(text, num).cipher
      puts 'Continue ciphering?(Y/N)'
      continue = false unless gets.chomp.upcase == 'Y'
    end
  rescue Caesar::TextEmptyError, Caesar::NumberZeroError => e
    puts e.message
  end
end

Runnable.new.run
