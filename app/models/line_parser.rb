class LineParser

  attr_reader :line

  include ApplicationHelper

  def initialize(line)
    @line = line
  end

  def user_params
    delimiter = find_delimiter(@line)
    args = @line.split(delimiter)
    raise ArgumentError, "A user record requires exactly 5 arguments." if args.length != 5
    user_params = {
      last_name: args[0],
      first_name: args[1],
      gender: args[2],
      favorite_color: args[3],
      date_of_birth: Date.parse(args[4])
    }
    user_params
  end

end