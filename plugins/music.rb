class Music
  include Cinch::Plugin

  match /spalbum (.+)/, method: :spotifyalbum

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

    # response.code
    m.reply "#{Format(:bold, name)} | #{Format(:bold, albumtype)} by #{Format(:bold, artist)} | #{url}"
  end
end
