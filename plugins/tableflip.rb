class TableFlip
  include Cinch::Plugin

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
end
