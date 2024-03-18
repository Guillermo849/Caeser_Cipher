# Class that will write the input from the user into a file.
# It will have the option to read the files.
class CaesarFiles
  def create_file(name, text)
    raise Errno::ENOENT, 'File not found' if name.chomp.empty?

    File.open("#{name}.txt", 'w') do |f|
      f.write("#{text}")
      f.close
    end
  end

  def read_file(name)
    raise Errno::ENOENT, 'File not found' if name.chomp.empty?

    File.foreach("#{name}.txt") { |line| puts line }
  end
end
