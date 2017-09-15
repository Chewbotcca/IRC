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

    if CONFIG['lazyconfig'] == 'on'
      c.user = CONFIG['nickname']
      c.realname = "Chewbotcca IRC Bot - http://github.com/Chewsterchew/ChewbotccaIRC"
    else
      if CONFIG['username'] == nil
        puts 'You did not set a username! Set one or set lazyconfig to on.'
        exit
      end
      c.user = CONFIG['username']
      c.realname = "#{CONFIG['realname']} - https://github.com/Chewsterchew/Chewbotcca"
    end

    # Plugins to Load, usually you don't need to modify
    c.plugins.plugins = [UuidLookup, JoinChannel, PartChannel, ServerStatus, Ping, Uptime, Restart, RandomCat, MemeDB, TRBMB, ModifyConfig, NickServ]

    # Check to see if the user really modified the config.
    if c.nick == '' || c.server == ''
      puts 'You did not configure your bot! Please configure the bot.'
      exit
    end
  end
end

# START THE BOT
bot.start
