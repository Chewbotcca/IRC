puts 'Welcome to Chewbotcca IRC bot setup'
puts 'This really simple GUI will guide you in setting up the bot by yourself!'
puts 'Press enter to get started'
puts 'WARNING: Your config will get WIPED if you continue. Only use this to setup.'
gets
puts 'Alright! Config time.'
begin
  require 'yaml'
rescue LoadError
  puts 'YAML not found! Is your ruby ok?'
end
File.new('config.yaml', 'w+') unless File.exist?('config.yaml')
exconfig = YAML.load_file('config.example.yaml')
File.open('config.yaml', 'w') { |f| f.write exconfig.to_yaml }
CONFIG = YAML.load_file('config.yaml')
puts 'Pick a nickname for the bot - REQUIRED'
CONFIG['nickname'] = gets.chomp
puts 'Enter the server address (hostname, IP, whatever, NO PORT yet) - REQUIRED '
CONFIG['server'] = gets.chomp
puts 'Enter the server port, if you don\'t know, use 6667 - REQUIRED '
CONFIG['port'] = gets.chomp
puts 'What channels should the bot join on startup? this must be comma seperated with #s before the names. - Optional'
puts 'Hint! You can always invite the bot to your channel and it will join!'
CONFIG['channels'] = gets.chomp
puts "What should be the bot's realname? This is shown on a whois. - Optional"
CONFIG['realname'] = gets.chomp
puts 'What should be the bot\'s USERNAME (this is what\'s shown before the @ in a hostname. e.g. chew!THIS@blah) - Optional'
CONFIG['username'] = gets.chomp
puts 'NickServ Password - Optional'
puts 'Not registered? THe bot has a built in nickserv registration process!'
CONFIG['nickservpass'] = gets.chomp
puts 'Owner hostmask - Optional'
puts "If you don't know, this can be added later."
CONFIG['ownerhost'] = gets.chomp
puts 'ModifyConfig Pass - Optional (recommended)'
puts "If you want to use commands (such as to set your ownerhost, or become a bot owner), you'll need to fill this out, and keep it secret!"
CONFIG['modifypass'] = gets.chomp
puts 'Wordnik API key. Very optional and only needed for !define !antonym and !synonym'
CONFIG['wordnik'] = gets.chomp
puts 'Your IRC Nickname. Please use your CURRENT nickname, you will need it for the next step'
CONFIG['ownernick'] = gets.chomp
puts 'Do you plan to use bundler (ruby gem)? If you don\'t know what this is, assume no and say "false", Otherwise say "true"'
CONFIG['bundler'] = gets.chomp
puts "This concludes our CONFIGURATION portion of the setup. Let's move on to gems!"
puts "First, let's save the config to a file."
puts 'Press enter to save'
gets
begin
  File.open('config.yaml', 'w') { |f| f.write CONFIG.to_yaml }
rescue => e
  puts 'uh oh, there was an error saving. Report the following error to Chew on github'
  puts e
end
if CONFIG['bundler'] == true
  puts 'Now, we will use bundler to install the gems! Please standby'
  `bundle install`
  puts 'All installed! Let\'s continue'
else
  puts 'Now, we are going to make sure you have all of your gems. Press enter to install neccessary gems.'
  require './requiregems.rb'
end
puts 'Now, a confirmation bot will join with the config you created and verify your identify. Hop on your irc client!'
if CONFIG['bundler'] == true
  `ruby scripts/confirm.rb`
else
  `bundle exec ruby scripts/confirm.rb`
end
puts 'You are ready to run your bot! Would you like to start this bot up now? (y/n)'
input = gets.chomp
if input == 'y'
  if CONFIG['bundler'] == true
    `ruby bot.rb`
  else
    `bundle exec ruby bot.rb`
  end
else
  puts 'Alright! To run, type ruby bot.rb or bundle exec ruby bot.rb'
  exit
end
