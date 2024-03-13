require_relative 'caesar_cipher'
# Child class from Caesar class that will ask input from the user
class Runnable < Caesar
  # It will check if there is text to cipher and if there is a valid number to change the letters
  def initialize
    puts 'Write a text to cipher'
    text = gets.chomp
    raise StandardError, 'The text given is empty.' if text.strip.empty?

    puts 'Input a number to cifer the text'
    num = gets.chomp.to_i
    raise StandardError, 'The number given cannot be 0.' if num.zero?

    super(text, num)
  end
end

puts Runnable.new.cipher
