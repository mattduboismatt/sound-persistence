require 'spec_helper.rb'

describe LineParser do

  describe '#initialize' do
    it 'has line property as string' do
      line_parser = LineParser.new("one two three")
      expect(line_parser.line).to eq "one two three"
    end
  end

  describe '#user_params' do

    context 'with comma delimited line' do
      it 'returns hash with user params' do
        line_parser = LineParser.new("one, two, three, four, 2000-01-01")
        expect(line_parser.user_params).to eq({last_name: 'one', first_name: 'two', gender: 'three', favorite_color: 'four', date_of_birth: Date.parse("2000-01-01")})
      end
    end

    context 'with pipe delimited line' do
      it 'returns hash with user params' do
        line_parser = LineParser.new("one | two | three | four | 2000-01-01")
        expect(line_parser.user_params).to eq({last_name: 'one', first_name: 'two', gender: 'three', favorite_color: 'four', date_of_birth: Date.parse("2000-01-01")})
      end
    end

    context 'with space delimited line' do
      it 'returns hash with user params' do
        line_parser = LineParser.new("one two three four 2000-01-01")
        expect(line_parser.user_params).to eq({last_name: 'one', first_name: 'two', gender: 'three', favorite_color: 'four', date_of_birth: Date.parse("2000-01-01")})
      end
    end

    context 'with less than 5 arguements' do
      it 'raises argument error' do
        line_parser = LineParser.new("one two three four")
        expect{line_parser.user_params}.to raise_error(ArgumentError, "A user record requires exactly 5 arguments.")
      end
    end

    context 'with more than 5 arguements' do
      it 'raises argument error' do
        line_parser = LineParser.new("one two three four 2001-01-01 six")
        expect{line_parser.user_params}.to raise_error(ArgumentError, "A user record requires exactly 5 arguments.")
      end
    end
  end
end