class ServerStatus
  include Cinch::Plugin

  match /server (.+)/, method: :checkserver

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
