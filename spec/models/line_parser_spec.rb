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
  end
end