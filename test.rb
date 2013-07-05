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

  def test_it_gets_all_success
    get '/all'
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

  def test_heater_model_hash
    assert_equal(Heater[1].to_h.keys, [:id, :set_temperature, :temperature, :enabled, :enabled_at])
  end

  def test_heater_model_set_temperature
    heater = Heater[1]
    heater.temperature = 20
    assert_equal heater.set_temperature, 20
  end

  def test_heater_model_enable
    heater = Heater[1]
    heater.enabled = false
    assert_equal heater.enabled, false
    heater.enabled = true
    assert_equal heater.enabled, true
  end
end