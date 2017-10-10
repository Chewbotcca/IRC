class Synonym
  include Cinch::Plugin

  match /synonym (.+)/, method: :synonym

  def synonym(m, word)
    grabbedword = JSON.parse(RestClient.get("http://api.wordnik.com/v4/word.json/#{word}/relatedWords?useCanonical=false&relationshipTypes=synonym&limitPerRelationshipType=10&api_key=#{CONFIG['wordnik']}"))
    begin
      if grabbedword['message'] == 'unauthorized'
        m.reply 'This requires an API key from wordnik.com'
      end
    rescue
      begin
        m.reply "Synonym(s) for #{word}: #{grabbedword[0]['words'].join(', ')}"
      rescue
        m.reply 'Word not found (or there were no Synonyms) Check your local spell-checker!'
      end
    end
  end
end
