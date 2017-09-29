class Reverse
  include Cinch::Plugin

  match /reverse (.+)/, method: :execute

  def execute(m, string)
    m.reply string.reverse
  end
end
