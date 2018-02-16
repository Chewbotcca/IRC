class RandomCat
  include Cinch::Plugin

  match /cat/, method: :showmethecatto
  match /multicat (.+)/, method: :multikitty
  match /mcat (.+)/, method: :multikitty
  match /kittens (.+)/, method: :multikitty

  def showmethecatto(m)
    whichcat = rand(2)
    showcat = if whichcat.zero?
                JSON.parse(RestClient.get('http://random.cat/meow'))['file']
              else
                Nokogiri::XML(open('http://thecatapi.com/api/images/get?format=xml&results_per_page=1')).xpath('//url').text
              end
    m.reply "#{['Aww!', 'Adorable.'].sample} #{showcat}"
  end

  def multikitty(m, amount)
    currentcat = 0
    caturls = ''
    amount = 1 if amount.to_i < 1
    amount = 5 if amount.to_i > 5
    while currentcat.to_i < amount.to_i
      whichcat = rand(0..1)
      showcat = if whichcat.zero?
                  JSON.parse(RestClient.get('http://random.cat/meow'))['file']
                else
                  Nokogiri::XML(open('http://thecatapi.com/api/images/get?format=xml&results_per_page=1')).xpath('//url').text
                end
      caturls = "#{showcat} #{caturls}"
      currentcat += 1
    end
    m.reply caturls.to_s
  end
end
