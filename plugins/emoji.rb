class Emoji
  include Cinch::Plugin

  match /b (.+)/, method: :b
  match /:b: (.+)/, method: :b
  match /🅱️ (.+)/, method: :b
  match /clap (.+)/, method: :clap
  match /:clap: (.+)/, method: :clap
  match /👏 (.+)/, method: :clap
  match /spread (.+)/, method: :spread

  def spread(m, args)
    m.reply args.split(' ').join('')
  end

  def b(m, args)
    m.reply args.gsub('b', '🅱️').gsub('B', '🅱️')
  end

  def clap(m, args)
    m.reply args.gsub(' ', ' 👏 ')
  end
end
