# Chewbotcca IRC Bot

# Require Gems needed to run programs and plugins
require './requiregems.rb'

# Load config from file
begin
  CONFIG = YAML.load_file('config.yaml')
rescue
  puts 'Config file not found, this is fatal, running setup.'
  `ruby setup.rb`
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
    c.nick = if CONFIG['nickname'] == '' || CONFIG['nickname'].nil?
               puts 'The bot doesn\'t have a nickname! Please set one'
               exit
             else
               CONFIG['nickname'].to_s
             end

    c.server = if CONFIG['server'] == '' || CONFIG['server'].nil?
                 puts 'You did not configure a server for the bot to connect to. Please set one!'
                 exit
               else
                 CONFIG['server'].to_s
               end

    c.channels = [CONFIG['channels']]

    c.port = if CONFIG['port'].nil?
               '6667'
             else
               CONFIG['port']
             end

    c.user = if CONFIG['username'].nil? || CONFIG['username'] == ''
               CONFIG['nickname']
             else
               CONFIG['username']
             end
             
    c.realname = if CONFIG['realname'].nil? || CONFIG['realname'] == ''
                   'Chewbotcca IRC Bot - https://git.io/ChewbotccaIRC'
                 else
                   "#{CONFIG['realname']} - https://git.io/ChewbotccaIRC"
                 end

    # Load modules.
    c.plugins.plugins = [Minecraft, Owner, Restart, RandomCat, MemeDB, TRBMB, ModifyConfig, NickServ, InviteToJoin, RonQuote, EBall, Bitcoin, QRCode, About, Define, Synonym, Antonym, WordRandom, Emoji, Food, TableFlip, Grammar, Formatting, BaseS4, Choose]
  end
end
# START THE BOT
bot.start
