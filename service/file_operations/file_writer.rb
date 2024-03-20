# frozen_string_literal: true

module FileOperations
  class Writer
    Error = Class.new(StandardError)
    NameEmptyError = Class.new(Error)
    FileNotFoundError = Class.new(Error)

    def initialize(name:, text: nil)
      @name = name
      @text = text
    end

    def write_file
      raise NameEmptyError, 'File name empty' if name.chomp.empty?
      raise FileNotFoundError, 'File not found' if File.file?(name.chomp)

      File.open("#{name}.txt", 'w') do |f|
        f.write(text)
        f.close
      end
    end

    private

    attr_reader :name, :text
  end
end
