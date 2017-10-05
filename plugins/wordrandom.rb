class WordRandom
  include Cinch::Plugin

  match /randomword/, method: :randomword
  match /wordrandom/, method: :randomword

  def randomword(m)
    if grabbedword['message'] == 'unauthorized'
      m.reply 'This requires an API key from wordnik.com'
    end
  rescue
    m.reply "Random Word: #{JSON.parse(RestClient.get("http://api.wordnik.com:80/v4/words.json/randomWord?hasDictionaryDef=true&minCorpusCount=0&maxCorpusCount=-1&minDictionaryCount=1&maxDictionaryCount=-1&minLength=5&maxLength=-1&api_key=#{CONFIG['wordnik']}"))['word']}"
  end
end
