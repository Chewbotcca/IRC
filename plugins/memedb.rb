class MemeDB
  include Cinch::Plugin

  match /memedb (.+)/, method: :findthatmeme

  def findthatmeme(m, meme)
    meme.downcase!
    if meme == 'submit'
      m.reply 'You can submit a meme here: http://goo.gl/forms/BRMomYVizsY7SqOg2'
      return
    end
    memelist = JSON.parse(RestClient.get('http://chewbotcca.co/memedb/memes.json'))
    memers = []
    (0..memelist.length - 1).each do |i|
      memers[memers.length] = memelist[i]['Meme']
    end
    memer = JSON.parse(RestClient.get("http://api.chew.pro/chewbotcca/memedb/#{meme}"))
    if memer['meme'] == 'Invalid Meme'
      m.reply "This meme doesn't exist! Make sure you spell the meme name right."
      sleep 1
      m.reply "Here is a list of the current memes: `#{memers.join(', ')}`"
      return
    end
    begin
      m.reply memer['url']
    rescue RestClient::BadRequest
      m.reply 'There was an error retrieving the meme!'
    end
  end
end
