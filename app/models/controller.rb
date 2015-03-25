require 'pry'

class Controller

  attr_reader :directory

  def initialize
    @directory = Directory.new
  end

  def run(input_dir)
    if input_dir.nil? || !Dir.exists?(input_dir)
      raise ArgumentError, "Argument must be a directory."
    end
    files = Dir.entries(input_dir)
    raise ArgumentError, "Directory is empty." if files.count == 2
    files.each do |file|
      next if file == '.' || file == '..'
      file_parser = FileParser.new(input_dir+file)
      file_parser.add_records_to_directory(@directory)
    end
    output
  end

  def output
    puts "-"*60
    puts "Output 1 – sorted by gender, then last name ascending"
    @directory.sort_by_gender!
    puts @directory.render
    puts "-"*60
    puts "Output 2 – sorted by birth date, ascending"
    @directory.sort_by_date_of_birth!
    puts @directory.render
    puts "-"*60
    puts "Output 3 – sorted by last name, descending"
    @directory.sort_by_last_name!
    puts @directory.render
  end
end