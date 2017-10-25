class Emoji
  include Cinch::Plugin

  match /b (.+)/, method: :b
  match /:b: (.+)/, method: :b
  match /🅱️ (.+)/, method: :b

  def b(m, args)
    m.reply args.gsub('b', '🅱️').gsub('B', '🅱️')
  end
end
