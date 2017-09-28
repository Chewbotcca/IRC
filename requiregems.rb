begin
  require 'cinch'
rescue LoadError
  puts "You're missing the gem `cinch`. Would you like to install this now? (y/n)"
  input = gets.chomp
  if input == 'y'
    `gem install cinch`
    puts 'Gem installed! Continuing..'
  else
    puts 'To continue, install the cinch gem'
    exit
  end
end
begin
  require 'RestClient'
rescue LoadError
  puts "You're missing the gem `rest-client`. Would you like to install this now? (y/n)"
  input = gets
  if input == 'y'
    eval `gem install rest-client`
    puts 'Gem installed! Continuing..'
  else
    puts 'To continue, install the rest-client gem'
    exit
  end
end
require 'json'
require 'net/http'
require 'yaml'
begin
  require 'Nokogiri'
rescue LoadError
  puts "You're missing the gem `nokogiri`. Would you like to install this now? (y/n)"
  input = gets
  if input == 'y'
    eval `gem install nokogiri`
    puts 'Gem installed! Continuing..'
  else
    puts 'To continue, install the nokogiri gem'
    exit
  end
end
require 'open-uri'
