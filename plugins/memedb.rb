class MemeDB
  include Cinch::Plugin

  match /memedb (.+)/, method: :findthatmeme

  def findthatmeme(m, meme)
    meme.downcase!
    prefix = ''
    prefix = '.gif' if %w[rickroll nicememe timetostop triggered noot].include? meme
    prefix = '.png' if %w[vegans losthope iplayedmyself nottheadmin pineapplepringle].include? meme
    prefix = '.jpg' if %w[spotad petpet youarerobot].include? meme
    prefix = '.JPG' if %w[paycheck pokesteak].include? meme
    prefix = '.jpeg' if %w[trap].include? meme
    m.reply 'You can submit a meme here: http://goo.gl/forms/BRMomYVizsY7SqOg2' if meme == 'submit'
    if prefix == ''
      m.reply "This meme doesn't exist! Make sure you spell the meme name right. Here is a list of the current memes: `rickroll, vegans, spotad, petpet, nicememe, paycheck, pokesteak, losthope, timetostop, trap, triggered, noot, iplayedmyself`"
    else
      m.reply "http://chewbotcca.co/memedb/#{meme}#{prefix}"
    end
  end
end
