# Chewbotcca IRC Bot

# Require Gems needed to run programs and plugins
require 'cinch'
require 'RestClient'
require "json"
require "net/http"
require 'yaml'

# Load config from file
CONFIG = YAML.load_file('config.yaml')

# Require each plugin
Dir["#{File.dirname(__FILE__)}/plugins/*.rb"].each { |file| require file }

# Configure the Bot
bot = Cinch::Bot.new do
  configure do |c|

    # Bot Settings, Taken from Config.yaml
  	c.nick = CONFIG['nickname']
    c.server = CONFIG['server']
    c.channels = [CONFIG['channels']]

    # Plugins to Load, usually you don't need to modify
    c.plugins.plugins = [UuidLookup, JoinChannel, PartChannel, ServerStatus, Ping]

    # Check to see if the user really modified the config.
    if (c.nick == '' || c.server == '' || c.channels == [""])
      puts "You did not configure your bot! Please configure the bot."
      exit
    end

  end

# A command I didn't convert to a plugin yet.
  on :message, "!cat" do |m|
    m.reply "#{JSON.parse(RestClient.get('http://random.cat/meow'))['file']}"
  end

end

# START THE BOT
bot.start
