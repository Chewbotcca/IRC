class Bitcoin
  include Cinch::Plugin

  match /bitcoin/, method: :bitcoin

  def bitcoin(m)
    grabthatsweetapi = JSON.parse(RestClient.get('https://api.coindesk.com/v1/bpi/currentprice.json'))
    m.reply "Bitcoin Conversions: USD: $#{grabthatsweetapi['bpi']['USD']['rate']}. GBP: £#{grabthatsweetapi['bpi']['GBP']['rate']}. EUR: €#{grabthatsweetapi['bpi']['EUR']['rate']}"
  end
end 
