# Class that will write the input from the user into a file.
class FileWriter
  WriterErros = Class.new(StandardError)
  NameEmpty = Class.new(WriterErros)
  FileNotFound = Class.new(WriterErros)

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

# It will read the files.
class FileReader
  ReadErrros = Class.new(StandardError)
  NameEmpty = Class.new(ReadErrros)
  FileNotFound = Class.new(ReadErrros)

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
