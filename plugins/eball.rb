class EBall
  include Cinch::Plugin

  match /8ball/, method: :eball

  def eball(m)
    goodresponse = Format(:italic, Format(:bold, Format(:green, ['As I see it, yes', 'It is certain', 'It is decidedly so', 'Most likely', 'Outlook good', 'Signs point to yes', 'One would be wise to think so', 'Naturally', 'Without a doubt', 'Yes', 'You may rely on it', 'You can count on it'].sample.to_s)))
    neutraulresponse = Format(:italic, Format(:bold, ['Better not tell you now!', 'Ask again later.', 'Cannot predict now', 'Cooldown enabled! Please try again.', 'Concentrate and ask again.', 'Rhetorical questions can be answered in solo', 'Maybe...'].sample.to_s))
    badresponse = Format(:italic, Format(:bold, Format(:red, ['You\'re kidding, right?', 'Don\'t count on it.', 'In your dreams', 'My reply is no', 'Outlook not so good', 'My disclosed sources say NO', 'One would be wise to think not', 'Very doubtful'].sample.to_s)))
    m.reply "The 8ball says: #{[goodresponse, neutraulresponse, badresponse].sample}"
  end
end
