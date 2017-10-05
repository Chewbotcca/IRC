class Antonym
  include Cinch::Plugin

  match /antonym (.+)/, method: :antonym

  def antonym(m, word)
    grabbedword = JSON.parse(RestClient.get("http://api.wordnik.com/v4/word.json/#{word}/relatedWords?useCanonical=false&relationshipTypes=antonym&limitPerRelationshipType=10&api_key=#{CONFIG['wordnik']}"))
    begin
      if grabbedword['message'] == 'unauthorized'
        m.reply 'This requires an API key from wordnik.com'
      end
    rescue
      begin
        m.reply "Antonym(s) for #{word}: #{grabbedword[0]['words'].join(', ')}"
      rescue
        m.reply 'Word not found (or there were no Antonyms) Check your local spell-checker!'
      end
    end
  end
end
