# frozen_string_literal: true

# Class that will write the input from the user into a file.
class FileWriter
  Error = Class.new(StandardError)
  NameEmptyError = Class.new(Error)
  FileNotFoundError = Class.new(Error)

  def initialize(name:, text: nil)
    @name = name
    @text = text
  end

  def write_file
    raise NameEmpty, 'File name empty' if name.chomp.empty?
    raise FileNotFound, 'File not found' if File.file?(name.chomp)

    File.open("#{name}.txt", 'w') do |f|
      f.write("#{text}")
      f.close
    end
  end

  private

  attr_reader :name, :text
end
