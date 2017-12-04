class Stats
  include Cinch::Plugin

  match /topspeaker/, method: :top
  match /topwords/, method: :topwords

  def top(m)
    m.reply 'Gathering top speakers in the channel....'
    channel = m.channel.to_s[1..m.channel.to_s.length]
    filename = "data/logs/#{channel}.yaml"
    unless File.exist?(filename)
      File.new(filename, 'w+')
      exconfig = YAML.load_file('data/logs/logs.example.yaml')
      File.open(filename, 'w') { |f| f.write exconfig.to_yaml }
      m.reply 'There is no log! No log = No top! Try again, bucko'
      return
    end
    data = false
    data = YAML.load_file(filename) while data == false
    count = data['count']
    users = {}.to_hash
    # Yay let's search every message
    current = count
    while current > 1
      colon = data[current].index(':')
      user = data[current][0..colon - 1]
      if users[user].nil?
        users[user] = 1
      else
        users[user] += 1
      end
      current -= 1
    end
    users = users.sort.sort_by { |_x, y| y }.reverse
    sleep 1
    m.reply "1st: #{Format(:bold, users[0][0].to_s)} with #{Format(:bold, users[0][1].to_s)} messages! #{Format(:bold, "(#{(users[0][1].to_f / count * 100).round(2)}%)")}"
    sleep 1
    if users.length > 1
      m.reply "2nd: #{Format(:bold, users[1][0].to_s)} with #{Format(:bold, users[1][1].to_s)} messages! #{Format(:bold, "(#{(users[1][1].to_f / count * 100).round(2)}%)")}"
    end
    sleep 1
    if users.length > 2
      m.reply "3rd: #{Format(:bold, users[2][0].to_s)} with #{Format(:bold, users[2][1].to_s)} messages! #{Format(:bold, "(#{(users[2][1].to_f / count * 100).round(2)}%)")}"
    end
    sleep 1
    m.reply "Altogether, everyone has sent #{Format(:bold, count.to_s)} messages! Woah!"
  end

  def topwords(m)
    m.reply 'Gathering top words in the channel....'
    channel = m.channel.to_s[1..m.channel.to_s.length]
    filename = "data/logs/#{channel}.yaml"
    unless File.exist?(filename)
      File.new(filename, 'w+')
      exconfig = YAML.load_file('data/logs/logs.example.yaml')
      File.open(filename, 'w') { |f| f.write exconfig.to_yaml }
      m.reply 'There is no log! No log = No top! Try again, bucko'
      return
    end
    data = false
    data = YAML.load_file(filename) while data == false
    count = data['count']
    users = {}.to_hash
    # Yay let's search every message
    current = count
    while current > 1
      colon = data[current].index(':')
      removed = data[current][colon + 2..data[current].length]
      eachword = removed.split(' ')
      currentword = 0
      while currentword < eachword.length
        word = eachword[currentword]
        word = word.tr('^A-Za-z0-9', '')
        word.downcase!
        if users[word].nil?
          users[word] = 1
        else
          users[word] += 1
        end
        currentword += 1
      end
      current -= 1
    end
    users = users.sort.sort_by { |_x, y| y }.reverse
    sleep 1
    m.reply "1st: Word #{Format(:bold, users[0][0].to_s)} used #{Format(:bold, users[0][1].to_s)} times!"
    sleep 1
    if users.length > 1
      m.reply "2nd: Word #{Format(:bold, users[1][0].to_s)} used #{Format(:bold, users[1][1].to_s)} times!"
    end
    sleep 1
    if users.length > 2
      m.reply "3rd: Word #{Format(:bold, users[2][0].to_s)} used #{Format(:bold, users[2][1].to_s)} times!"
    end
  end
end
