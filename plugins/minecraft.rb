class Minecraft
  include Cinch::Plugin

  match /uuid (.+)/, method: :uuid
  match /server (.+)/, method: :checkserver
  match /mcserver (.+)/, method: :checkserver
  match /namemc (.+)/, method: :namemcsearch
  match /mcstatus/, method: :mcstatus
  match /namemcf (.+)/, method: :namemcfriends

  def namemcfriends(m, name)
    name = name.delete(' ')
    uuid = JSON.parse(RestClient.get("https://api.mojang.com/users/profiles/minecraft/#{name}"))['id']
    friends = JSON.parse(RestClient.get("https://api.namemc.com/profile/#{uuid}/friends"))
    if friends.empty?
      m.reply "User #{name} doesn't have any friends on namemc! :("
      return
    else
      friendcount = 0
      amount = friends.length
      friendlist = []
      while friendcount < amount
        friendlist[friendcount] = friends[friendcount]['name']
        friendcount += 1
        if friendlist.join(', ').length > 350
          overload = ".. and #{amount - friendcount} more."
          amount = friendcount
        end
      end
      m.reply "List of #{name}'s NameMC friends: #{friendlist.join(', ')}.#{overload}"
    end
  end

  def mcstatus(m)
    statusurl = JSON.parse(RestClient.get('https://status.mojang.com/check'))
    url1 = Format(:"#{statusurl[0]['minecraft.net']}", 'Minecraft Site')
    url2 = Format(:"#{statusurl[1]['session.minecraft.net']}", 'Minecraft Sessions')
    url3 = Format(:"#{statusurl[2]['account.mojang.com']}", 'Mojang Accounts')
    url4 = Format(:"#{statusurl[3]['authserver.mojang.com']}", 'Mojang Auth Servers')
    url5 = Format(:"#{statusurl[4]['sessionserver.mojang.com']}", 'Mojang Sessions')
    url6 = Format(:"#{statusurl[5]['api.mojang.com']}", 'Moajng API')
    url7 = Format(:"#{statusurl[6]['textures.minecraft.net']}", 'Minecraft Textures')
    url8 = Format(:"#{statusurl[7]['mojang.com']}", 'Mojang Site')
    message = "#{Format(:green, 'Up')} - #{Format(:yellow, 'Shakey')} - #{Format(:red, 'Down')} : #{url1} - #{url2} - #{url3} - #{url4} - #{url5} - #{url6} - #{url7} - #{url8}"
    m.reply message
  end

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
      info = JSON.parse(RestClient.get("https://eu.mc-api.net/v3/server/ping/#{serv}"))
      sleep 1
      if info['online'] == true
        m.reply 'Online'
        sleep 1
        m.reply "Players [Online/Max]: #{info['players']['online']}/#{info['players']['max']}"
        sleep 1
        m.reply "Version: #{info['version']['name']}"
      else
        m.reply 'Offline'
      end
    end
  end
end
