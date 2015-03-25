require 'spec_helper.rb'
require_relative '../../api/sound_persistence.rb'
require 'rack/test'

describe SoundPersistence::API do
  include Rack::Test::Methods

  def app
    SoundPersistence::API
  end

  describe SoundPersistence::API do
    describe "GET /records/gender" do
      it "returns directory records sorted by gender, as json" do
        get "/records/gender"
        expect(last_response.status).to eq(200)
        expect(JSON.parse(last_response.body.last)).to eq {}
      end
    end
  end
end