require File.expand_path('../environment', __FILE__)
require 'app'

set :run, false
set :raise_errors, true

run Sinatra::Application
