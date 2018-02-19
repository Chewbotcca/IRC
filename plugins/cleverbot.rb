class Cleverbot
  include Cinch::Plugin

  match /cleverbot (.+)/, method: :cleverbot
  match /cb (.+)/, method: :cleverbot

  def cleverbot(m, input)
    File.open("data/logs/#{m.channel.to_s[1..m.channel.to_s.length]}.txt", 'a+') { |f| f.puts("[#{Time.now.to_i}] #{m.user.name}: #{input}") }
    begin
      response = JSON.parse(RestClient.get(URI.escape("https://www.cleverbot.com/getreply?key=#{CONFIG['cleverbot']}&input=#{input}&cs=#{CONFIG['cs']}")))
    rescue StandardError
      m.reply 'An error occured! Make sure you have a Cleverbot API key!'
      return
    end
    CONFIG['cs'] = response['cs']
    File.open('config.yaml', 'w') { |f| f.write CONFIG.to_yaml }
    interaction = 'interaction_1_other'
    m.reply "Cleverbot says: #{response[interaction]}"
    File.open("data/logs/#{m.channel.to_s[1..m.channel.to_s.length]}.txt", 'a+') { |f| f.puts("[#{Time.now.to_i}] [BOT]Cleverbot: #{response[interaction]}") }
  end
end
