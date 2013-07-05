require File.expand_path('../environment', __FILE__)
require 'app'
require 'test/unit'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_gets_root_success
    get '/'
    assert_equal({ success: true, devices: Heater.all }.to_json, last_response.body)
  end

  def test_id_get
    get '/1'
    assert_equal({ success: true, device: Heater[1].to_h }.to_json, last_response.body)
  end

  def test_post_id
    post '/1', {temperature: 15, enabled: true}.to_json, "CONTENT_TYPE" => "application/json"
    assert_equal({ success: true, device: Heater[1].to_h }.to_json, last_response.body)
  end



end