require './config/environment.rb'
require './api/sound_persistence.rb'

set :app_file, __FILE__

run SoundPersistence::API