require_relative 'caesar_cipher'
# Class that will ask the user for input for the cipher method of the Caesar class
# It will repite this process until the user says something other tha y(Yes)
class Runner
  def run
    loop do
      begin
        puts 'Write a text to cipher'
        text = gets.chomp
        puts 'Input a number to cifer the text'
        num = gets.chomp.to_i
        puts Caesar.new(text, num).cipher
        puts 'Continue ciphering?(Y/N)'
        break unless gets.chomp.upcase == 'Y'
      rescue Caesar::TextEmptyError, Caesar::NumberZeroError => e
        puts e.message
      end
    end
  end
end

Runner.new.run
