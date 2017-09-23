class TRBMB
  include Cinch::Plugin

  match /trbmb/, method: :trbmb

  def trbmb(m)
    m.reply JSON.parse(RestClient.get("https://api.chew.pro/trbmb"))[0]
  end
end
