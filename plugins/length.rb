class Length
  include Cinch::Plugin

  match /length (.+)/, method: :execute

  def execute(m, string)
    m.reply "That string has #{string.length} characters."
  end
end
