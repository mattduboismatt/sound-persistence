require 'spec_helper.rb'

describe ApplicationHelper do
  include ApplicationHelper

  describe '#formatted_date' do
    it 'returns date in M/D/YYYY format' do
      expect(formatted_date(Date.parse('1998-01-07'))).to eq "1/7/1998"
    end
    it 'returns date in M/D/YYYY format' do
      expect(formatted_date(Date.parse('2005-06-27'))).to eq "6/27/2005"
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
