class About
  include Cinch::Plugin

  match /about/, method: :about

  def about(m)
    m.reply "Chewbotcca is a bot by Chewsterchew. Check it out: https://git.io/ChewbotccaIRC"
  end
end
