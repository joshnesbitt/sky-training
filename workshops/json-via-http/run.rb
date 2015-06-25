api = Client.new('jsontest.com')

puts "IP:", api.ip
puts "Date:", api.date
puts "MD5:", api.md5(text: 'testing')
