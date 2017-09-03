class RandomCat
  include Cinch::Plugin

  match /cat/, method: :showmethecatto

  def showmethecatto(m)
    jsoncat = JSON.parse(RestClient.get('http://random.cat/meow'))['file']
    xmlcat = Nokogiri::XML(open('http://thecatapi.com/api/images/get?format=xml&results_per_page=1')).xpath('//url').text
    m.reply "#{['Aww!', 'Adorable.'].sample} #{[jsoncat, xmlcat].sample}"
  end
end
