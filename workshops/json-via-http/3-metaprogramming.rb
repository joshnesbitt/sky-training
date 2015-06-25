require 'net/http'
require 'json'

class Client
  attr_reader :host

  SUPPORTED_METHODS = %w( ip date md5 )

  def initialize(host)
    @host = host
  end

private

  def method_missing(name, *args, &block)
    name = name.to_s

    if SUPPORTED_METHODS.include?(name)
      uri = URI("http://#{name}.#{host}/")
      uri.query = URI.encode_www_form(args.first || {})
      response = Net::HTTP.get_response(uri)
      data = JSON.parse(response.body)
      data[name]
    else
      super
    end
  end
end

api = Client.new('jsontest.com')

puts "IP:", api.ip
puts "Date:", api.date
puts "MD5:", api.md5(text: 'testing')
