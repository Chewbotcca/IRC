class RandomCat
  include Cinch::Plugin

  match /cat/, method: :showmethecatto

  def showmethecatto(m)
    whichcat = rand(2)
    if whichcat.zero?
      showcat = JSON.parse(RestClient.get('http://random.cat/meow'))['file']
    else
      showcat = Nokogiri::XML(open('http://thecatapi.com/api/images/get?format=xml&results_per_page=1')).xpath('//url').text
    end
    m.reply "#{['Aww!', 'Adorable.'].sample} #{showcat}"
  end
end
