class Upper
  include Cinch::Plugin

  match /upper (.+)/, method: :execute
  match /upcase (.+)/, method: :execute
  match /up (.+)/, method: :execute
  match /uppercase (.+)/, method: :execute

  def execute(m, message)
    m.reply message.upcase
  end
end
