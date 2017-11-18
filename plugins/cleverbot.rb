class Cleverbot
  include Cinch::Plugin

  match /cleverbot (.+)/, method: :cleverbot
  match /cb (.+)/, method: :cleverbot

  def cleverbot(m, input)
    response = JSON.parse(RestClient.get(URI.escape("https://www.cleverbot.com/getreply?key=#{CONFIG['cleverbot']}&input=#{input}&cs=&callback=ProcessReply")))
    # CS will be used eventually!!
    CONFIG['cs'] = response['cs']
    File.open('config.yaml', 'w') { |f| f.write CONFIG.to_yaml }
    on = response['interaction_count']
    interaction = "interaction_#{on}_other"
    m.reply "Cleverbot says: #{response[interaction]}"
  end
end
