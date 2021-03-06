require 'spec_helper.rb'
require_relative '../../api/sound_persistence.rb'
require 'rack/test'

describe SoundPersistence::API do
  include Rack::Test::Methods

  def app
    SoundPersistence::API
  end

  let(:space_record) { 'Aaa Mike Male Red 2015-01-01' }
  let(:comma_record) { 'Aaa, Mike, Male, Red, 2015-01-01' }
  let(:pipe_record) { 'Aaa | Mike | Male | Red | 2015-01-01' }

  before :context do
    first_user = User.new({
      first_name: 'Mary',
      last_name: 'Aaa',
      gender: 'Female',
      favorite_color: 'Red',
      date_of_birth: Date.parse('1900-01-01')
    })
    @directory = $controller.directory
    @directory.add_user(first_user)
  end

  describe SoundPersistence::API do

    describe 'POST /records' do

      context 'with space delimited entry' do
        it 'returns success message and adds record to directory' do
          post "/records", { record: space_record }
          expect(last_response.status).to eq 201
          expect(last_response.body).to eq "Added the record.".to_json
          expect(@directory.users.count).to eq 8
        end
      end

      context 'with comma delimited entry' do
        it 'returns success message and adds record to directory' do
          post "/records", { record: comma_record }
          expect(last_response.status).to eq 201
          expect(last_response.body).to eq "Added the record.".to_json
          expect(@directory.users.count).to eq 9
        end
      end

      context 'with pipe delimited entry' do
        it 'returns success message and adds record to directory' do
          post "/records", { record: pipe_record }
          expect(last_response.status).to eq 201
          expect(last_response.body).to eq "Added the record.".to_json
          expect(@directory.users.count).to eq 10
        end
      end

      context 'with invalid entry' do
        it 'returns error message and does not add record to directory' do
          post "/records", { foo: 'bar' }
          expect(last_response.status).to eq 400
          expect(@directory.users.count).to eq 10
        end
      end

    end

    describe 'GET' do

      context '/records/gender' do
        it "returns directory records as json" do
          get "/records/gender"
          expect(last_response.status).to eq(200)
          expect(last_response.header['Content-Type']).to include 'application/json'
        end
        it 'correctly sorts records by gender, then last name descending' do
          get "/records/gender"
          expect(JSON.parse(last_response.body)['users'].count).to eq 10
          expect(JSON.parse(last_response.body)['users'].first['last_name']).to eq 'Aaa'
        end
      end

      context '/records/birthdate' do
        it "returns directory records as json" do
          get "/records/birthdate"
          expect(last_response.status).to eq(200)
          expect(last_response.header['Content-Type']).to include 'application/json'
        end
        it 'correctly sorts records by date of birth, ascending' do
          get "/records/birthdate"
          expect(JSON.parse(last_response.body)['users'].count).to eq 10
          expect(JSON.parse(last_response.body)['users'].first['date_of_birth']).to eq '1/1/1900'
        end
      end

      context '/records/name' do
        it "returns directory records as json" do
          get "/records/name"
          expect(last_response.status).to eq(200)
          expect(last_response.header['Content-Type']).to include 'application/json'
        end
        it 'correctly sorts records by last name, descending' do
          get "/records/name"
          expect(JSON.parse(last_response.body)['users'].count).to eq 10
          expect(JSON.parse(last_response.body)['users'].last['last_name']).to eq 'Aaa'
        end
      end

    end
  end
end