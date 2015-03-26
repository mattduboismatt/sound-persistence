require 'simplecov'
require 'pathname'
require 'date'
require 'grape'
require 'grape-entity'
SimpleCov.start

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'models', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }

$spec_seed_directory = 'spec/spec_lib/'

$controller = Controller.new
$controller.seed($spec_seed_directory)