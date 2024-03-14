# Class that will write the input from the user into a file.
# It will have the option to read the files.
class CaesarFiles
  def create_file(name, text)
    File.open("#{name}.txt", 'w') do |f|
      f.write("#{text}")
      f.close
    end
  end
end
