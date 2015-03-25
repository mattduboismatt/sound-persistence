class FileParser

  attr_reader :file

  def initialize(file)
    @file = file
  end

  def add_records_to_directory(dir)
    File.open(@file).each do |line|
      line_parser = LineParser.new(line.chomp)
      user = User.new(line_parser.user_params)
      dir.add_user(user)
    end
  end
end