class Google
  include Cinch::Plugin

  match /video (.+)/, method: :youtube
  match /googl (.+)/, method: :googl
  match /youtube (.+)/, method: :searchyt
  match %r{(https?://.*?)(?:\s|$|,|\.\s|\.$)}, use_prefix: false, method: :youtube

  def searchyt(m, search)
    url = URI.escape("https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=1&q=#{search}&key=#{CONFIG['google']}")
    id = JSON.parse(RestClient.get(url))['items'][0]['id']['videoId']
    video = "http://youtu.be/#{id}"
    youtube(m, video, true)
  rescue
    m.reply 'This commmand requires a Google API key!'
    return
  end

  def googl(m, url)
    m.reply JSON.parse(RestClient.post("https://www.googleapis.com/urlshortener/v1/url?key=#{CONFIG['google']}", { 'longUrl' => url }.to_json, content_type: :json))['id']
  rescue
    m.reply 'This command requires a Google API key!'
    return
  end

  def youtube(m, url, provideurl = false)
    begin
      givenurl = url
      url = url.split(/[\/,&,?,=]/)
      case url[2]
      when 'www.youtube.com'
        id = url[5]
      when 'youtu.be'
        id = url[3]
      end
      url = JSON.parse(RestClient.get("https://www.googleapis.com/youtube/v3/videos?id=#{id}&key=#{CONFIG['google']}&part=snippet,contentDetails,statistics"))
    rescue
      m.reply 'This command requires a Google API key!'
      return
    end
    stats = url['items'][0]['statistics']
    info = url['items'][0]['snippet']
    length = url['items'][0]['contentDetails']['duration']
    length = length[2..length.length]
    length.downcase!
    views = stats['viewCount'].to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    likes = stats['likeCount'].to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    dislike = stats['dislikeCount'].to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    upload = info['publishedAt'][0..9]
    upload = upload.split('-')
    case upload[1]
    when '01'
      month = 'January'
    when '02'
      month = 'Feburary'
    when '03'
      month = 'March'
    when '04'
      month = 'April'
    when '05'
      month = 'May'
    when '06'
      month = 'June'
    when '07'
      month = 'July'
    when '08'
      month = 'August'
    when '09'
      month = 'September'
    when '10'
      month = 'October'
    when '11'
      month = 'November'
    when '12'
      month = 'December'
    end
    urlpls = if provideurl
               " #{givenurl}"
             else
               '.'
             end
    m.reply "#{Format(:bold, (info['title']).to_s)} by #{Format(:bold, (info['channelTitle']).to_s)} - length: #{length} - #{views} views - #{likes} likes - #{dislike} dislikes - Uploaded on: #{month} #{upload[2]}, #{upload[0]}#{urlpls}"
  end
end
