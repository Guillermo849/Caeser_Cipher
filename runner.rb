# frozen_string_literal: true

require_relative 'caesar_cipher'
require_relative 'file_operations/file_reader'
require_relative 'file_operations/file_writer'

# Class that will ask the user for input for the cipher method of the Caesar class
# It will repite this process until the user says something other tha y(Yes)
class Runner
  include FileOperations
  def run
    loop do
      # Read previous files
      puts 'Would you like to read previous files?(Y/N)'
      if gets.chomp.upcase == 'Y'
        puts Dir['*.txt']
        puts 'What file would you like to read?'
        file_reader = FileOperations::FileReader.new(name: gets.chomp)
        file_reader.read_file
      end
      # Cipher text
      puts 'Write a text to cipher'
      text = gets.chomp
      puts 'Input a number to cifer the text'
      num = gets.chomp.to_i
      cipher_text = Caesar.new(text, num).cipher
      puts cipher_text
      # Writes cipher file
      puts 'Write the name of the file'
      file_name = gets.chomp
      text = "#{cipher_text} - #{text}"
      file_writer = FileOperations::FileWriter.new(name: file_name, text: text)
      file_writer.write_file
      # Question to restart the loop
      puts 'Would you like to cipher a new code?(Y/N)'
      break unless gets.chomp.upcase == 'Y'
    rescue Caesar::Error, FileOperations::FileReader::Error, FileOperations::FileWriter::Error => e
      puts e.message
    end
  end
end

Runner.new.run
