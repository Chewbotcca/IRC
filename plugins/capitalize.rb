class Capitalize
  include Cinch::Plugin

  match /capitalize (.+)/, method: :execute
  match /cap (.+)/, method: :execute

  def execute(m, message)
    m.reply message.capitalize
  end
end
