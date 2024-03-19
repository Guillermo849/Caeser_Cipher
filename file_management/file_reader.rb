# frozen_string_literal: true

# It will read the files.
class FileReader
  Error = Class.new(StandardError)
  NameEmptyError = Class.new(Error)
  FileNotFoundError = Class.new(Error)

  def initialize(name:)
    @name = name
  end

  def read_file
    raise NameEmpty, 'File name empty' if name.chomp.empty?
    raise FileNotFound, 'File not found' if File.file?(name.chomp)

    File.foreach("#{name}.txt") { |line| puts line }
  end

  private

  attr_reader :name
end
