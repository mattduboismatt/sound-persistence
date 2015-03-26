require 'spec_helper.rb'
require_relative '../../api/sound_persistence.rb'
require 'rack/test'

describe SoundPersistence::API do
  include Rack::Test::Methods

  def app
    SoundPersistence::API
  end

  let(:directory) { $controller.directory }
  let(:first_record) { 'Zzz Mary Female Red 1900-01-01' }
  let(:last_record) { 'Aaa Mike Male Red 2015-01-01' }

  describe SoundPersistence::API do
    describe "GET /records/gender" do
      it "returns directory records sorted by gender, as json" do
        get "/records/gender"
        expect(last_response.status).to eq(200)
        expect(JSON.parse(last_response.body)).to eq "test"
      end
    end
  end
end