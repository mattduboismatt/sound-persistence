require 'spec_helper.rb'

describe User do
  let(:user) { User.new({
    first_name: 'Aaa',
    last_name: 'Bbb',
    gender: 'Male',
    favorite_color: 'Red',
    date_of_birth: Date.parse('2001-01-01')
  }) }

  describe '#initialize' do
    it 'has name, gender, color, and DOB properties' do
      expect(user.first_name).to eq 'Aaa'
      expect(user.last_name).to eq 'Bbb'
      expect(user.gender).to eq 'Male'
      expect(user.favorite_color).to eq 'Red'
      expect(user.date_of_birth).to eq Date.parse('2001-01-01')
    end
  end

  describe '#render' do
    it 'renders a string output for a user' do
      expect(user.render).to eq "Bbb Aaa Male Red 1/1/2001"
    end
  end

end