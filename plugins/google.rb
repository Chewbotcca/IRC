class Google
  include Cinch::Plugin

  match /youtube (.+)/, method: :youtube

  def youtube(m, url)
    begin
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
    m.reply "#{Format(:bold, (info['title']).to_s)} by #{Format(:bold, (info['channelTitle']).to_s)} - length: #{length} - #{views} views - #{likes} likes - #{dislike} dislikes - Uploaded on: #{month} #{upload[2]}, #{upload[0]}."
  end
end
