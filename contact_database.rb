## TODO: Implement CSV reading/writing
require 'active_record'

puts "Establishing Connection..."

ActiveRecord::Base.establish_connection(
  database: 'd7a3eod2r4ja7f',
  username: 'hvzvmtuzwvwzwx',
  password: 'HmxmJY9xIpUjvabvoIbW8ZCvkD',
  host: 'ec2-107-22-253-198.compute-1.amazonaws.com',
  port: 5432,
  adapter: 'postgresql')

puts "Connected!"