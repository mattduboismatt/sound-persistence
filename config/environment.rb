require 'pathname'
require 'date'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'models', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }