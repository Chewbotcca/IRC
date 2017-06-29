require 'cinch'
require 'RestClient'
require "json"
require "net/http"

class UuidLookup
  include Cinch::Plugin

  match /uuid (.+)/, method: :lookforit
  def lookforit(m, name)
    m.reply "The UUID of #{name} is: #{JSON.parse(RestClient.get("https://api.mojang.com/users/profiles/minecraft/#{name}"))['id']}"
  end
end

class ServerStatus
  include Cinch::Plugin

  match /server (.+)/, method: :checkserver
  def checkserver(m, serv)
    m.reply "Server Info for #{serv}:"
    sleep 0.5
    if JSON.parse(RestClient.get("https://eu.mc-api.net/v3/server/ping/#{serv}"))['online'] == true
      m.reply "Online"
      sleep 0.5
      m.reply "Players [Online/Max]: #{JSON.parse(RestClient.get("https://eu.mc-api.net/v3/server/ping/#{serv}"))['players']['online']}/#{JSON.parse(RestClient.get("https://eu.mc-api.net/v3/server/ping/#{serv}"))['players']['max']}"
      sleep 0.5
      m.reply "Version: #{JSON.parse(RestClient.get("https://eu.mc-api.net/v3/server/ping/#{serv}"))['version']['name']}"
    else
      m.reply "Offline"
    end
  end
end

class JoinChannel
  include Cinch::Plugin

  match /join (.+)/, method: :join

  def join(m, join)
    if(m.user.host == "yourhost")
      Channel(join).join
      m.reply "Joined the channel successfully!"
    else
      m.reply "You are not permitted to do this action!"
    end
  end
end

class PartChannel
  include Cinch::Plugin

  match /part (.+)/, method: :join

  def join(m, part)
    if(m.user.host == "yourhost")
      Channel(part).part
      m.reply "Left the channel successfully!"
    else
      m.reply "You are not permitted to do this action!"
    end
  end
end

bot = Cinch::Bot.new do
  configure do |c|
  	c.nick = "Chewbotcca"
    c.server = ""
    c.channels = [""]
    c.plugins.plugins = [UuidLookup, ServerStatus, JoinChannel, PartChannel]
  end

  on :message, "!cat" do |m|
    m.reply "#{JSON.parse(RestClient.get('http://random.cat/meow'))['file']}"
  end
end

bot.start
