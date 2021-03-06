# Chewbotcca IRC Bot

# Require Gems needed to run programs and plugins
require './requiregems.rb'

# Load config from file
begin
  CONFIG = YAML.load_file('config.yaml')
rescue StandardError
  puts 'Config file not found, this is fatal, running setup.'
  `ruby setup.rb`
  exit
end

# Require each plugin
Dir["#{File.dirname(__FILE__)}/plugins/*.rb"].each { |file| require file }

# Set up uptime.
STARTTIME = Time.now

# Pre-Config
botnick = if CONFIG['nickname'] == '' || CONFIG['nickname'].nil?
            puts 'The bot doesn\'t have a nickname! Please set one'
            exit
          else
            CONFIG['nickname'].to_s
          end

botserver = if CONFIG['server'] == '' || CONFIG['server'].nil?
              puts 'You did not configure a server for the bot to connect to. Please set one!'
              exit
            else
              CONFIG['server'].to_s
            end

botport = if CONFIG['port'].nil?
            '6667'
          else
            CONFIG['port']
          end

botuser = if CONFIG['username'].nil? || CONFIG['username'] == ''
            CONFIG['nickname']
          else
            CONFIG['username']
          end

commits = `git rev-list master | wc -l`.to_i
commit = if commits.zero?
           ''
         else
           " | Version: #{commits}"
         end

botrealname = if CONFIG['realname'].nil? || CONFIG['realname'] == ''
                "Chewbotcca IRC Bot - https://git.io/ChewbotccaIRC#{commit}"
              else
                "#{CONFIG['realname']} - https://git.io/ChewbotccaIRC#{commit}"
              end

botssl = if CONFIG['ssl'].nil? || CONFIG['ssl'] == '' || CONFIG['ssl'] == 'false' || CONFIG['ssl'] == false
           nil
         else
           'true'
         end

botserverpass = if CONFIG['serverpass'].nil? || CONFIG['serverpass'] == ''
                  nil
                else
                  CONFIG['serverpass']
                end

if CONFIG['prefix'].nil? || CONFIG['prefix'] == ''
  CONFIG['prefix'] = '!'
  File.open('config.yaml', 'w') { |f| f.write CONFIG.to_yaml }
end

botprefix = if CONFIG['prefixstart'].nil? || CONFIG['prefixstart'] == '' || CONFIG['prefixstart'] == 'true' || CONFIG['prefixstart'] == true
              /^#{Regexp.quote(CONFIG['prefix'])}/
            else
              /#{Regexp.quote(CONFIG['prefix'])}/
            end

# Configure the Bot
bot = Cinch::Bot.new do
  configure do |c|
    # Bot Settings, Taken from pre-config
    c.nick = botnick
    c.server = botserver
    c.channels = [CONFIG['channels']]
    c.port = botport
    c.user = botuser
    c.realname = botrealname
    c.messages_per_second = 5
    c.ssl.use = botssl
    c.password = botserverpass
    c.plugins.prefix = botprefix

    plugincount = Dir.glob(File.join('plugins', '**', '*.rb')).select { |file| File.file?(file) }.count
    pluginlist = Array.new(plugincount)
    x = 0
    Dir["#{File.dirname(__FILE__)}/plugins/*.rb"].each do |wow|
      bob = File.readlines(wow) { |line| line.split.map(&:to_s).join }
      command = bob[0][6..bob[0].length]
      command.delete!("\n")
      command = Object.const_get(command)
      pluginlist[x] = command
      x += 1
    end

    # Load modules.
    c.plugins.plugins = pluginlist
  end
end

def authenticate(m)
  name = m.user.name
  stafffile = "data/staff/#{name}.yaml"
  return false unless File.exist?(stafffile)
  staffdata = YAML.load_file(stafffile)
  authtype = staffdata['authtype']
  if authtype == 'host'
    return true if staffdata['host'] == m.user.host
  end
  if authtype == 'username'
    return true if staffdata['user'] == m.user.user
  end
  if authtype == 'nickname'
    return true if staffdata['nick'] == m.user.nick
  end
  if authtype == 'userhost'
    return true if staffdata['user'] == m.user.user && staffdata['host'] == m.user.host
  end
  if authtype == 'all'
    return true if staffdata['user'] == m.user.user && staffdata['host'] == m.user.host && staffdata['nick'] == m.user.nick
  end
  false
end

def checkperm(_m, user, perm)
  stafffile = "data/staff/#{user}.yaml"
  return unless File.exist?(stafffile)
  staffdata = YAML.load_file(stafffile)
  return true if staffdata['all'] == true
  return true if staffdata[perm] == true
  false
end

def checkchan(_m, chan, setting)
  chan = chan.to_s[1..chan.to_s.length]
  channelfile = "data/channels/#{chan}.yaml"
  unless File.exist?(channelfile)
    File.new(channelfile, 'w+')
    exconfig = YAML.load_file('data/channels/channel.example.yaml')
    exconfig['name'] = channel
    File.open(channelfile, 'w') { |f| f.write exconfig.to_yaml }
  end
  data = false
  data = YAML.load_file(channelfile) while data == false
  return true if data[setting] == 'true'
  false
end

# START THE BOT
bot.start
