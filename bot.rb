# Chewbotcca IRC Bot

# Require Gems needed to run programs and plugins
require './requiregems.rb'

# Load config from file
begin
  CONFIG = YAML.load_file('config.yaml')
rescue
  puts 'Config file not found, this is fatal, please configure the bot.'
  exit
end

# Require each plugin
Dir["#{File.dirname(__FILE__)}/plugins/*.rb"].each { |file| require file }

# Set up uptime.
STARTTIME = Time.now

# Configure the Bot
bot = Cinch::Bot.new do
  configure do |c|
    # Bot Settings, Taken from Config.yaml
    c.nick = CONFIG['nickname'].to_s
    c.server = CONFIG['server']
    c.channels = [CONFIG['channels']]

    c.user = if CONFIG['username'].nil? || CONFIG['username'] == ''
               CONFIG['nickname']
             else
               CONFIG['username']
             end
    c.realname = if CONFIG['realname'].nil? || CONFIG['realname'] == ''
                   'Chewbotcca IRC Bot - http://chew.pro/ChewbotccaIRC'
                 else
                   "#{CONFIG['realname']} - https://chew.pro/ChewbotccaIRC"
                 end

    # Load modules.
    c.plugins.plugins = [UuidLookup, JoinChannel, PartChannel, ServerStatus, Ping, Uptime, Restart, RandomCat, MemeDB, TRBMB, ModifyConfig, NickServ, InviteToJoin, Capitalize, Upper, Eval, RonQuote, EBall, Bitcoin, Length, Reverse, QRCode, About, Update]

    # Check to see if the user really modified the config.
    if c.nick.nil? || c.server.nil?
      puts 'You did not configure your bot! Please configure the bot.'
      exit
    end
  end
end

# START THE BOT
bot.start
