require 'spec_helper.rb'

describe Directory do

  let(:directory) { Directory.new }

  let(:user1) { User.new({
    first_name: 'Aaa',
    last_name: 'Aaa',
    gender: 'Male',
    favorite_color: 'Red',
    date_of_birth: Date.parse('2001-01-01')
  }) }

  let(:user2) { User.new({
    first_name: 'Bbb',
    last_name: 'Bbb',
    gender: 'Female',
    favorite_color: 'Red',
    date_of_birth: Date.parse('2000-01-01')
  }) }

  let(:user3) { User.new({
    first_name: 'Ccc',
    last_name: 'Ccc',
    gender: 'Female',
    favorite_color: 'Red',
    date_of_birth: Date.parse('2002-01-01')
  }) }

  let(:directory_with_users) { Directory.new([user1,user2,user3]) }

  describe '#initialize' do
    it 'has a users property as blank array' do
      expect(directory.users).to eq []
    end
  end

  describe '#add_user' do
    it 'adds user' do
      expect{
        directory.add_user(user1)
        directory.add_user(user2)
        directory.add_user(user3)
        }.to change{directory.users.length}.from(0).to(3)
    end
  end

  describe '#sort_by_gender' do
    it 'sorts by gender (f then m), then by last name ascending' do
      expect(directory_with_users.sort_by_gender[0]).to eq user2
      expect(directory_with_users.sort_by_gender[1]).to eq user3
      expect(directory_with_users.sort_by_gender[2]).to eq user1
    end
  end

  describe '#sort_by_date_of_birth' do
    it 'sorts by date of birth' do
      expect(directory_with_users.sort_by_date_of_birth[0]).to eq user2
      expect(directory_with_users.sort_by_date_of_birth[1]).to eq user1
      expect(directory_with_users.sort_by_date_of_birth[2]).to eq user3
    end
  end

  describe '#sort_by_last_name' do
    it 'sorts by last name descending' do
      expect(directory_with_users.sort_by_last_name[0]).to eq user3
      expect(directory_with_users.sort_by_last_name[1]).to eq user2
      expect(directory_with_users.sort_by_last_name[2]).to eq user1
    end
  end

end