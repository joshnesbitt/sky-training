#
# Implement the app
#

require 'sinatra'
require 'json'

class Authenticator
  # Note: Really what this would be doing is
  # looking a user up and performing a password
  # comparison, but for testing purposes we're
  # making this a lot simpler.

  USERNAME = 'josh'
  PASSWORD = 'password'

  class << self

    def authenticate(username, password)
      USERNAME == username &&
      PASSWORD == password
    end

  end
end


post '/authenticate' do
  if Authenticator.authenticate(params[:username], params[:password])
    response = {
      success: true,
      token: SecureRandom.hex(16)
    }
  else
    response = {
      success: false,
      token: nil
    }

    status 401
  end

  JSON.generate(response)
end

#
# Test it
#

ENV['RACK_ENV'] = 'test'

require 'test/unit'
require 'rack/test'

class HelloWorldTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def test_it_authenticates_with_correct_credentials
    post('/authenticate', username: 'josh', password: 'password')

    assert last_response.ok?
    assert body['success']
    assert body['token'].size == 32
  end

  def test_it_fails_to_authenticate_with_bad_credentials
    post('/authenticate', username: 'josh', password: 'incorrect')

    assert !last_response.ok?
    assert !body['success']
    assert body['token'].nil?
  end

private

  def app
    Sinatra::Application
  end

  def body
    JSON.parse(last_response.body)
  end
end
