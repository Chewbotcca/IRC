class MemeDB
  include Cinch::Plugin

  match /memedb (.+)/, method: :findthatmeme

  def findthatmeme(m, meme)
    meme.downcase!
    case meme
    when 'deanmeme'
      m.reply 'http://chew.pro/Chewbotcca/memes/deanmeme.png'
    when 'rickroll'
      m.reply 'http://chew.pro/Chewbotcca/memes/rickroll.gif'
    when 'vegans'
      m.reply 'http://chew.pro/Chewbotcca/memes/vegans.png'
    when 'spotad'
      m.reply 'http://chew.pro/Chewbotcca/memes/spotad.jpg'
    when 'petpet'
      m.reply 'http://chew.pro/Chewbotcca/memes/petpet.jpg'
    when 'nicememe'
      m.reply 'http://chew.pro/Chewbotcca/memes/nicememe.gif'
    when 'paycheck'
      m.reply 'http://chew.pro/Chewbotcca/memes/paycheck.JPG'
    when 'pokesteak'
      m.reply 'http://chew.pro/Chewbotcca/memes/pokesteak.JPG'
    when 'losthope'
      m.reply 'http://chew.pro/Chewbotcca/memes/losthope.png'
    when 'timetostop'
      m.reply 'http://chew.pro/Chewbotcca/memes/timetostop.gif'
    when 'trap'
      m.reply 'http://chew.pro/Chewbotcca/memes/trap.jpeg'
    when 'triggered'
      m.reply 'https://chew.pro/Chewbotcca/memes/triggered.gif'
    when 'noot'
      m.reply 'https://chew.pro/Chewbotcca/memes/noot.gif'
    when 'iplayedmyself'
      m.reply 'https://chew.pro/Chewbotcca/memes/iplayedmyself.png'
    when 'submit'
      m.reply 'You can submit a meme here: <http://goo.gl/forms/BRMomYVizsY7SqOg2>'
    else
      m.reply "This meme doesn't exist! Make sure you spell the meme name right (CASE SENSITIVE). Here is a list of the current memes: `deanmeme, rickroll, vegans, spotad, petpet, nicememe, paycheck, pokesteak, losthope, timetostop, trap, triggered, noot, iplayedmyself`"
    end
  end
end
