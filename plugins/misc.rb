class Misc
  include Cinch::Plugin

  match /choose (.+)/, method: :choose
  match /flip/, method: :flip
  match /coin/, method: :flip
  match /qr (.+)/, method: :execute
  match /qrcode (.+)/, method: :execute
  match /8ball/, method: :eball
  match /isup (.+)/, method: :isup

  def isup(m, url)
    uri = URI.parse("http://downforeveryoneorjustme.com/#{url}")
    response = Net::HTTP.get_response(uri)

    status = response.body.include?('It\'s just you')

    ups = ['You need to fix your internet, because', "Listen here, it's not my fault your internet sucks,", 'Get a good web browser, like Firefox!', "Why are you asking me if it's up?"].sample
    downs = ['Dang, that website has some bad uptime.', "Let's cheer this website up"].sample
    if status
      m.reply "#{ups} #{url} is #{Format(:bold, Format(:green, 'Up!'))}"
    else
      m.reply "#{downs} #{url} is #{Format(:bold, Format(:red, 'Down!'))}"
    end
  end

  def eball(m)
    goodresponse = Format(:italic, Format(:bold, Format(:green, ['As I see it, yes', 'It is certain', 'It is decidedly so', 'Most likely', 'Outlook good', 'Signs point to yes', 'One would be wise to think so', 'Naturally', 'Without a doubt', 'Yes', 'You may rely on it', 'You can count on it'].sample.to_s)))
    neutraulresponse = Format(:italic, Format(:bold, ['Better not tell you now!', 'Ask again later.', 'Cannot predict now', 'Cooldown enabled! Please try again.', 'Concentrate and ask again.', 'Rhetorical questions can be answered in solo', 'Maybe...'].sample.to_s))
    badresponse = Format(:italic, Format(:bold, Format(:red, ['You\'re kidding, right?', 'Don\'t count on it.', 'In your dreams', 'My reply is no', 'Outlook not so good', 'My disclosed sources say NO', 'One would be wise to think not', 'Very doubtful'].sample.to_s)))
    m.reply "The 8ball says: #{[goodresponse, neutraulresponse, badresponse].sample}"
  end

  def execute(m, string)
    m.reply URI.escape("https://api.qrserver.com/v1/create-qr-code/?data=#{string}&size=150x150&.png")
  end

  def flip(m)
    first = ['I flipped a coin, and it landed on', 'I threw the coin into the air and it finally landed on', 'I dropped the coin, it landed on'].sample
    headtails = Format(:bold, Format(:italic, %w[heads tails].sample))
    m.reply "#{first} #{headtails}"
  end

  def choose(m, args)
    args = args.split(',')
    m.reply args.sample
  end
end
