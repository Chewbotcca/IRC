class Memes
  include Cinch::Plugin

  match /memerator (.+)/, method: :memeratormeme
  match /meme (.+)/, method: :memeratormeme
  match %r{(https?://.*?)(?:\s|$|,|\.\s|\.$)}, use_prefix: false, method: :memeratorlink

  def memeratorlink(m, url)
    url = url.split('/')
    memeratormeme(m, url[4], false, true) if url[2] == 'memerator.me'
  end

  def memeratormeme(m, memeid, notifynotfound = true, nourl = nil)
    memeid.downcase!
    begin
      meme = JSON.parse(RestClient.get("https://memerator.me/api/v1/meme/#{memeid}", Authorization: CONFIG['memerator']))
    rescue StandardError
      m.reply 'Meme not found!' if notifynotfound
      return
    end
    message =  "Memerator Meme - \"#{meme['caption']}\" by #{meme['author']['username']} - Rating: #{meme['rating']['average'].round(2)} stars"
    message = "#{message} | URL: https://memerator.me/meme/#{memeid}" if nourl.nil?
    m.reply message
  end
end
