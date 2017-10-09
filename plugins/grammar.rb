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

  def up(m, message)
    m.reply message.upcase
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
end
