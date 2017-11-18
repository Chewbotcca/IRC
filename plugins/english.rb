class Define
  include Cinch::Plugin

  match /define (.+)/, method: :define

  def define(m, word)
    grabbedword = JSON.parse(RestClient.get("http://api.wordnik.com/v4/word.json/#{word}/definitions?limit=1&includeRelated=true&useCanonical=false&includeTags=false&api_key=#{CONFIG['wordnik']}"))
    begin
      if grabbedword['message'] == 'unauthorized'
        m.reply 'This requires an API key from wordnik.com'
      end
    rescue
      begin
        m.reply "Defintion for #{word}: #{grabbedword[0]['partOfSpeech']}. #{grabbedword[0]['text']}"
      rescue
        m.reply 'Word not found! Check your local spell-checker!'
      end
    end
  end
end
