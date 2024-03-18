require_relative 'caesar_cipher'
require_relative 'caesar_files'
# Class that will ask the user for input for the cipher method of the Caesar class
# It will repite this process until the user says something other tha y(Yes)
class Runner
  def run
    loop do
      cipher = call_cipher
      puts cipher
      call_write_file(cipher)
      puts 'Continue ciphering?(Y/N)'
      break unless gets.chomp.upcase == 'Y'
    rescue Caesar::TextEmptyError, Caesar::NumberZeroError, Errno::ENOENT => e
      puts e.message
    end
  end

  private

  def call_cipher
    puts 'Write a text to cipher'
    text = gets.chomp
    puts 'Input a number to cifer the text'
    num = gets.chomp.to_i
    Caesar.new(text, num).cipher
  end

  def call_write_file(cipher)
    @caesar_f = CaesarFiles.new unless defined? @caesar_f
    puts 'Write the name of the file'
    file_name = gets.chomp
    puts 'Write some text if you want to add text'
    text = "#{cipher} - #{gets.chomp}"
    @caesar_f.create_file(file_name, text)
  end
end

Runner.new.run
