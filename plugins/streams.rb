class Streams
  include Cinch::Plugin

  match /mixer (.+)/, method: :mixer
  match %r{(https?://.*?)(?:\s|$|,|\.\s|\.$)}, use_prefix: false, method: :mixerlink

  def mixerlink(m, url)
    url = url.split('/')
    mixer(m, url[3], false) if url[2] == 'mixer.com'
  end

  def mixer(m, user, notifynotfound = true)
    user = user.delete(' ')
    begin
      parse = JSON.parse(RestClient.get("https://mixer.com/api/v1/channels/#{user}"))
    rescue StandardError
      m.reply 'User not found!' if notifynotfound
      return
    end
    name = parse['token']
    online = if parse['online']
               Format(:green, 'Currently Streaming!')
             else
               Format(:red, 'Currently Offline')
             end
    followers = parse['numFollowers'].to_s
    m.reply "Info for Mixer user #{Format(:bold, name)} | #{Format(:bold, online)} | Followers: #{Format(:bold, followers)} | Stream Title: #{Format(:bold, parse['name'])} | Total Views: #{Format(:bold, parse['viewersTotal'].to_s)} | URL: http://mixer.com/#{name}"
  end
end
