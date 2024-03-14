# Class that will write the input from the user into a file.
# It will have the option to read the files.
class CaesarFiles
  def create_file(name, text)
    File.open("#{name}.txt", 'w') do |f|
      f.write("#{text}")
      f.close
    end
  end

  def read_file(name)
    File.foreach("#{name}.txt") { |line| puts line }
  rescue Errno::ENOENT => e
    puts e.message
  end
end
