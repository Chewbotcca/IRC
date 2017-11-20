class Streams
  include Cinch::Plugin

  match /mixer (.+)/, method: :mixer

  def mixer(m, user)
    user.delete!(' ')
    begin
      parse = JSON.parse(RestClient.get("https://mixer.com/api/v1/channels/#{user}"))
    rescue
      m.reply 'User not found!'
      return
    end
    online = if parse['online']
               Format(:green, 'Currently Streaming!')
             else
               Format(:red, 'Currently Offline.')
             end
    followers = parse['numFollowers']
    m.reply "Info for Mixer user #{Format(:bold, user)}. #{online} Followers: #{Format(:bold, followers)}! Stream Title: #{Format(:bold, parsed['name'])}. Total Views: #{Format(:bold, parsed['viewersTotal'])}. URL: http://mixer.com/#{user}"
  end
end
