# frozen_string_literal: true

module FileOperations
  class Reader
    Error = Class.new(StandardError)
    NameEmptyError = Class.new(Error)
    FileNotFoundError = Class.new(Error)

    def initialize(name:)
      @name = name
    end

    def read_file
      raise NameEmptyError, 'File name empty' if name.chomp.empty?
      raise FileNotFoundError, 'File not found' if File.file?(name.chomp)

      File.foreach("#{name}.txt") { |line| puts line }
    end

    private

    attr_reader :name
  end
end
