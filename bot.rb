# Chewbotcca IRC Bot

# Require Gems needed to run programs and plugins
require 'cinch'
require 'RestClient'
require 'json'
require 'net/http'
require 'yaml'
require 'Nokogiri'
require 'open-uri'

# Load config from file
CONFIG = YAML.load_file('config.yaml')

# Require each plugin
Dir["#{File.dirname(__FILE__)}/plugins/*.rb"].each { |file| require file }

# Set up uptime.
STARTTIME = Time.now

# Configure the Bot
bot = Cinch::Bot.new do
  configure do |c|
    # Bot Settings, Taken from Config.yaml
    c.nick = CONFIG['nickname']
    c.server = CONFIG['server']
    c.channels = [CONFIG['channels']]

    c.user = if CONFIG['username'].nil?
               CONFIG['nickname']
             else
               CONFIG['username']
             end
    c.realname = if CONFIG['realname'].nil?
                   'Chewbotcca IRC Bot - http://chew.pro/ChewbotccaIRC'
                 else
                   "#{CONFIG['realname']} - https://chew.pro/ChewbotccaIRC"
                 end

    # Load this if Modules isn't configured.
    c.plugins.plugins = [UuidLookup, JoinChannel, PartChannel, ServerStatus, Ping, Uptime, Restart, RandomCat, MemeDB, TRBMB, ModifyConfig, NickServ]

    # Check to see if the user really modified the config.
    if c.nick.nil? || c.server.nil? || c.nick == '' || c.server == ''
      puts 'You did not configure your bot! Please configure the bot.'
      exit
    end
  end
end

# START THE BOT
bot.start
