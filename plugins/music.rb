class Music
  include Cinch::Plugin

  match /spalbum (.+)/, method: :spotifyalbum
  match /spartist (.+)/, method: :spotifyartist
  timer 3600, method: :updatespotify
  match /spotifyapi/, method: :checkperms
  match /spotify (.+)/, method: :spotifytrack

  def spotifytrack(m, song)
    uri = URI.parse("https://api.spotify.com/v1/search?q=#{song}&type=track&market=US&limit=1")
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
    track = parse['tracks']['items'][0]
    name = track['name']
    albumtype = track['album']['album_type'].capitalize
    album = track['album']['name']
    artist = track['artists'][0]['name']
    url = track['external_urls']['spotify']

    m.reply "#{Format(:bold, name)} | found in the #{albumtype} #{Format(:bold, album)} by #{Format(:bold, artist)} | #{url}"
  end

  def checkperms(m)
    updatespotify if m.user.host == CONFIG['ownerhost']
    nil
  end

  def updatespotify
    return if CONFIG['spotifyclientid'] == '' || CONFIG['spotifyclientid'].nil?
    return if CONFIG['spotifysecret'] == '' || CONFIG['spotifysecret'].nil?
    encodeid = Base64.encode64("#{CONFIG['spotifyclientid']}:#{CONFIG['spotifysecret']}")

    uri = URI.parse('https://accounts.spotify.com/api/token')
    request = Net::HTTP::Post.new(uri)
    request['Authorization'] = "Basic #{encodeid.delete("\n")}"
    request.set_form_data(
      'grant_type' => 'client_credentials'
    )

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    parsed = JSON.parse(response.body)
    CONFIG['spotify'] = parsed['access_token']
    File.open(filename, 'w') { |f| f.write CONFIG.to_yaml }
  end

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
