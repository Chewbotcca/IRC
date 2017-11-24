class Music
  include Cinch::Plugin

  match /spalbum (.+)/, method: :spotifyalbum
  match /spartist (.+)/, method: :spotifyartist
  timer 3600, method: :updatespotify
  match /spotifyapi/, method: :checkperms
  match /spotify (.+)/, method: :spotifytrack
  match /lastfm (.+)/, method: :lastfmtrack

  def lastfmtrack(m, user)
    if CONFIG['lastfm'].nil? || CONFIG['lastfm'] == ''
      m.reply 'This command requires an API key from last.fm!'
      return
    end
    parse = JSON.parse(RestClient.get("http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&limit=1&user=#{user}&api_key=#{CONFIG['lastfm']}&format=json"))

    base = parse['recenttracks']['track'][0]

    artist = base['artist']['#text']
    track = base['name']
    album = base['album']['#text']

    begin
      np = base['@attr']['nowplaying']
      timeago = np
      playing = true
    rescue
      np = base['date']['uts']
      t = Time.now.to_i - np.to_i
      mm, ss = t.divmod(60)
      hh, mm = mm.divmod(60)
      dd, hh = hh.divmod(24)
      timeago = format('%d days, %d hours, %d minutes and %d seconds', dd, hh, mm, ss)
      playing = false
    end

    if playing
      m.reply "#{Format(:bold, user)} is currently listening to #{Format(:bold, track)} by #{Format(:bold, artist)} found in the album #{Format(:bold, album)}."
    else
      m.reply "#{Format(:bold, user)} last listened to #{Format(:bold, track)} by #{Format(:bold, artist)} found in the album #{Format(:bold, album)} about #{Format(:bold, timeago)} ago."
    end
  end

  def checkspotifykey
    return 'no-key' if CONFIG['spotify'].nil? || CONFIG['spotify'] == ''
    return 'missing-client' if CONFIG['spotifyclientid'].nil? || CONFIG['spotifyclientid'] == '' || CONFIG['spotifysecret'].nil? || CONFIG['spotifysecret'] == ''
    true
  end

  def spotifytrack(m, song)
    unless checkspotifykey == true
      updatekey if checkspotifykey == 'no-key'
      if checkspotifykey == 'missing-client' || checkspotifykey == 'no-key'
        m.reply 'Missing Spotify Client Credentials! MSCC!!'
        return
      end
    end
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
  rescue
    m.reply 'No songs found with the given parameters!'
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
    unless checkspotifykey == true
      updatekey if checkspotifykey == 'no-key'
      if checkspotifykey == 'missing-client' || checkspotifykey == 'no-key'
        m.reply 'Missing Spotify Client Credentials! MSCC!!'
        return
      end
    end
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
    unless checkspotifykey == true
      updatekey if checkspotifykey == 'no-key'
      if checkspotifykey == 'missing-client' || checkspotifykey == 'no-key'
        m.reply 'Missing Spotify Client Credentials! MSCC!!'
        return
      end
    end
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
