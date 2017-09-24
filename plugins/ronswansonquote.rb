class RonQuote
  include Cinch::Plugin

  match /ronquote/, method: :getquote
  match /ronswanson/, method: :getquote
  match /ron/, method: :getquote

  def getquote(m)
    m.reply "\"#{JSON.parse(RestClient.get("http://ron-swanson-quotes.herokuapp.com/v2/quotes"))[0]}\" -Ron Swanson"
  end
end
