class Quotes
  include Cinch::Plugin

  match /ron/, method: :getquote
  match /trbmb/, method: :trbmb

  def trbmb(m)
    m.reply JSON.parse(RestClient.get('http://api.chew.pro/trbmb'))[0]
  end

  def getquote(m)
    m.reply "\"#{JSON.parse(RestClient.get('http://ron-swanson-quotes.herokuapp.com/v2/quotes'))[0]}\" -Ron Swanson"
  end
end
