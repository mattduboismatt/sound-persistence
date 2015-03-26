require 'spec_helper.rb'

describe ApplicationHelper do
  include ApplicationHelper

  describe '#date_to_str' do
    it 'returns date in M/D/YYYY format' do
      expect(date_to_str(Date.parse('1998-01-07'))).to eq "1/7/1998"
    end
    it 'returns date in M/D/YYYY format' do
      expect(date_to_str(Date.parse('2005-06-27'))).to eq "6/27/2005"
    end
  end

  describe '#str_to_date' do
    it 'returns date object from a string' do
      date = str_to_date("1/7/1998")
      expect(date).to be_an_instance_of Date
      expect(date.year).to eq 1998
    end
  end

  describe '#find_delimiter' do
    context 'with arg including commas' do
      it 'returns the delimiter' do
        expect(find_delimiter("one, two, three")).to eq ", "
      end
    end
    context 'with arg including pipes' do
      it 'returns the delimiter' do
        expect(find_delimiter("one | two | three")).to eq " | "
      end
    end
    context 'with arg not including commas or pipes' do
      it 'returns the space delimiter' do
        expect(find_delimiter("one two three")).to eq " "
      end
    end
  end
end
