class English
  include Cinch::Plugin

  match /define (.+)/, method: :define
  match /randomword/, method: :randomword
  match /wordrandom/, method: :randomword
  match /synonym (.+)/, method: :synonym
  match /antonym (.+)/, method: :antonym

  def checkapi
    if CONFIG['wordnik'] == '' || CONFIG['wordnik'].nil?
      'false'
    else
      'true'
    end
  end

  def antonym(m, word)
    unless checkapi == 'true'
      m.reply 'This command requires an API key from wordnik'
      return
    end
    grabbedword = JSON.parse(RestClient.get("http://api.wordnik.com/v4/word.json/#{word}/relatedWords?useCanonical=false&relationshipTypes=antonym&limitPerRelationshipType=10&api_key=#{CONFIG['wordnik']}"))
    begin
      m.reply "Antonym(s) for #{word}: #{grabbedword[0]['words'].join(', ')}"
    rescue
      m.reply 'Word not found (or there were no Antonyms) Check your local spell-checker!'
    end
  end

  def synonym(m, word)
    unless checkapi == 'true'
      m.reply 'This command requires an API key from wordnik'
      return
    end
    grabbedword = JSON.parse(RestClient.get("http://api.wordnik.com/v4/word.json/#{word}/relatedWords?useCanonical=false&relationshipTypes=synonym&limitPerRelationshipType=10&api_key=#{CONFIG['wordnik']}"))
    begin
      m.reply "Synonym(s) for #{word}: #{grabbedword[0]['words'].join(', ')}"
    rescue
      m.reply 'Word not found (or there were no Synonyms) Check your local spell-checker!'
    end
  end

  def randomword(m)
    unless checkapi == 'true'
      m.reply 'This command requires an API key from wordnik'
      return
    end
    m.reply "Random Word: #{JSON.parse(RestClient.get("http://api.wordnik.com:80/v4/words.json/randomWord?hasDictionaryDef=true&minCorpusCount=0&maxCorpusCount=-1&minDictionaryCount=1&maxDictionaryCount=-1&minLength=5&maxLength=-1&api_key=#{CONFIG['wordnik']}"))['word']}"
  end

  def define(m, word)
    unless checkapi == 'true'
      m.reply 'This command requires an API key from wordnik'
      return
    end
    grabbedword = JSON.parse(RestClient.get("http://api.wordnik.com/v4/word.json/#{word}/definitions?limit=1&includeRelated=true&useCanonical=false&includeTags=false&api_key=#{CONFIG['wordnik']}"))
    begin
      m.reply "Defintion for #{word}: #{grabbedword[0]['partOfSpeech']}. #{grabbedword[0]['text']}"
    rescue
      m.reply 'Word not found! Check your local spell-checker!'
    end
  end
end
