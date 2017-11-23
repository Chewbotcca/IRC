class Grammar
  include Cinch::Plugin

  match /reverse (.+)/, method: :reverse
  match /length (.+)/, method: :length
  match /capitalize (.+)/, method: :cap
  match /cap (.+)/, method: :cap
  match /upper (.+)/, method: :up
  match /upcase (.+)/, method: :up
  match /up (.+)/, method: :up
  match /uppercase (.+)/, method: :up
  match /downcase (.+)/, method: :down
  match /down (.+)/, method: :down
  match /derpify (.+)/, method: :derp
  match /titlecase (.+)/, method: :titlecase
  match /title (.+)/, method: :titlecase
  match /swap (.+)/, method: :swap
  match /swapcase (.+)/, method: :swap
  match /tableflip (.+)/, method: :flipthat
  match /table (.+)/, method: :flipthat

  def flipthat(m, args)
    # what a mess, am i right? how can i simplify this
    args.downcase!
    args = args.tr('a', 'ɐ')
    args = args.tr('b', 'q')
    args = args.tr('c', 'ɔ')
    args = args.tr('d', 'p')
    args = args.tr('e', 'ǝ')
    args = args.tr('f', 'ɟ')
    args = args.tr('g', 'ƃ')
    args = args.tr('h', 'ɥ')
    args = args.tr('i', 'ᴉ')
    args = args.tr('j', 'ɾ')
    args = args.tr('k', 'ʞ')
    args = args.tr('l', 'ן')
    args = args.tr('m', 'ɯ')
    args = args.tr('n', 'u')
    args = args.tr('o', 'o')
    args = args.tr('p', 'd')
    args = args.tr('q', 'b')
    args = args.tr('r', 'ɹ')
    args = args.tr('s', 's')
    args = args.tr('t', 'ʇ')
    args = args.tr('u', 'n')
    args = args.tr('v', 'ʌ')
    args = args.tr('w', 'ʍ')
    args = args.tr('x', 'x')
    args = args.tr('y', 'ʎ')
    args = args.tr('z', 'z')
    args.reverse!
    m.reply "#{['(╯°□°）╯ ︵', '( ﾉ♉︵♉ ）ﾉ ︵', '( ﾉ⊙︵⊙）ﾉ ︵'].sample} #{args}"
  end

  def derp(m, args)
    args.upcase!
    args = args.gsub('BECAUSE', %w[BECUZ BECAS CUZ BECZ].sample.to_s)
    args = args.gsub('THAT', %w[DAT TAT DHAT DATA THAT].sample.to_s)
    args = args.gsub('SCHOOL', %w[SKEWL SCHEWL SCOOL SKMOOP SKOWL].sample.to_s)
    args = args.gsub('LIKE', %w[LIAK LIEK LOKE LICK LIKE].sample.to_s)
    args = args.gsub('HELP', %w[HALP HEEPL HAAPLE HELP].sample.to_s)
    args = args.gsub('THE', %w[TEH DA DAH THE].sample.to_s)
    args = args.gsub('?', ['??!!!', '!?!?!', '???!!', '??/??'].sample.to_s)
    args = args.gsub('!', ['!!11!', '!11!!1', '!!1!1'].sample.to_s)
    args = args.gsub('YOU\'RE', %w[UR YOUR YORE].sample.to_s)
    args = args.gsub('YOUR', ['UR', 'YOUR', 'YOU\'RE', 'YORE'].sample.to_s)
    args = args.gsub('PLEASE', %w[PLSSSS PLZ PLEEE].sample.to_s)
    args = args.gsub('E', %w[E 3].sample.to_s)
    args = "#{args} #{['WTF', 'WTF LOL', 'LOL', 'OMG', '', 'OMG LOL'].sample}"
    m.reply args[0..400]
  end

  def swap(m, message)
    m.reply message.swapcase
  end

  def up(m, message)
    m.reply message.upcase
  end

  def down(m, message)
    m.reply message.downcase
  end

  def cap(m, message)
    m.reply message.capitalize
  end

  def length(m, string)
    m.reply "That string has #{string.length} characters."
  end

  def reverse(m, string)
    m.reply string.reverse
  end

  def titlecase(m, string)
    m.reply string.gsub(/\w+/, &:capitalize)
  end
end
