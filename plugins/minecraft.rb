class Minecraft
  include Cinch::Plugin

  match /uuid (.+)/, method: :uuid
  match /server (.+)/, method: :checkserver
  match /namemc (.+)/, method: :namemcsearch

  def namemcsearch(m, name)
    name = name.delete(' ')
    m.reply "NameMC Search: http://namemc.com/s/#{name}"
  end

  def uuid(m, name)
    name = name.delete(' ')
    if !JSON.parse(RestClient.get("https://use.gameapis.net/mc/player/profile/#{name}"))['error'].nil?
      m.reply "Error: #{JSON.parse(RestClient.get("https://use.gameapis.net/mc/player/profile/#{name}"))['error']} Make sure it is spelled correctly. (It is not case-sensitive)"
    else
      m.reply "The UUID of #{JSON.parse(RestClient.get("https://use.gameapis.net/mc/player/profile/#{name}"))['name']} is: #{JSON.parse(RestClient.get("https://use.gameapis.net/mc/player/profile/#{name}"))['uuid_formatted']}"
    end
  end

  def checkserver(m, serv)
    serv = serv.delete(' ')
    if serv.delete('.') == serv
      m.reply 'Not a valid address! Server IP SHOULD have dots somewhere.'
    else
      m.reply "Server Info for #{serv}:"
      sleep 0.5
      if JSON.parse(RestClient.get("https://eu.mc-api.net/v3/server/ping/#{serv}"))['online'] == true
        m.reply 'Online'
        sleep 0.5
        m.reply "Players [Online/Max]: #{JSON.parse(RestClient.get("https://eu.mc-api.net/v3/server/ping/#{serv}"))['players']['online']}/#{JSON.parse(RestClient.get("https://eu.mc-api.net/v3/server/ping/#{serv}"))['players']['max']}"
        sleep 0.5
        m.reply "Version: #{JSON.parse(RestClient.get("https://eu.mc-api.net/v3/server/ping/#{serv}"))['version']['name']}"
      else
        m.reply 'Offline'
      end
    end
  end
end
