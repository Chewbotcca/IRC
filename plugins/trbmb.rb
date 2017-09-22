class TRBMB
  include Cinch::Plugin

  match /trbmb/, method: :trbmb

  def trbmb(m)
    m.reply JSON.parse(RestClient.get("https://trbmb.herokuapp.com/"))[0]
  end
end
