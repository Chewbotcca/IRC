class Music
  include Cinch::Plugin

  match /spalbum (.+)/, method: :spotifyalbum
  match /spartist (.+)/, method: :spotifyartist

  def spotifyartist(m, search)
    uri = URI.parse("https://api.spotify.com/v1/search?q=#{search}&type=artist&market=US&limit=1")
    request = Net::HTTP::Get.new(uri)
    request['Accept'] = 'application/json'
    request['Authorization'] = "Bearer #{CONFIG['spotify']}"

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    parse = JSON.parse(response.body)
    parsed = parse['artists']['items'][0]
    artist = parsed['name']
    url = parsed['external_urls']['spotify']

    m.reply "#{Format(:bold, artist)} | #{url}"
  rescue
    m.reply 'No artists found!'
  end

  def spotifyalbum(m, search)
    uri = URI.parse("https://api.spotify.com/v1/search?q=#{search}&type=album&market=US&limit=1")
    request = Net::HTTP::Get.new(uri)
    request['Accept'] = 'application/json'
    request['Authorization'] = "Bearer #{CONFIG['spotify']}"

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    parse = JSON.parse(response.body)
    parsed = parse['albums']['items'][0]
    name = parsed['name']
    artist = parsed['artists'][0]['name']
    albumtype = parsed['album_type'].capitalize
    url = parsed['external_urls']['spotify']

    m.reply "#{Format(:bold, name)} | #{Format(:bold, albumtype)} by #{Format(:bold, artist)} | #{url}"
  rescue
    m.reply 'No Albums found!'
  end
end
