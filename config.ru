require File.expand_path('../environment', __FILE__)
require 'app'

set :run, false
set :raise_errors, true
set :public_dir, File.dirname(__FILE__) + '/touch_app'

run Sinatra::Application
