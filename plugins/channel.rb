class Channel
  include Cinch::Plugin

  listen_to :channel, method: :log_public_message, strip_colors: true
  match /resethistory/, method: :clearlog
  match /quote/, method: :quote

  def quote(m)
    channel = m.channel.to_s[1..m.channel.to_s.length]
    filename = "data/logs/#{channel}.yaml"
    unless File.exist?(filename)
      File.new(filename, 'w+')
      exconfig = YAML.load_file('data/logs/logs.example.yaml')
      File.open(filename, 'w') { |f| f.write exconfig.to_yaml }
      m.reply 'There is no log! No log = No quotes! Try again, bucko'
      return
    end
    data = false
    while data == false
      data = YAML.load_file(filename)
    end
    count = data['count']
    ichoose = rand(1..count)
    colon = data[ichoose].index(':')
    removed = data[ichoose][colon + 2..data[ichoose].length]
    user = data[ichoose][0..colon - 1]
    m.reply "Long ago, #{user} said: \"#{removed}\""
  end

  def getrank(m, user)
    return 'owner' if m.channel.owners.join(' ').split(' ').include?(user)
    return 'admin' if m.channel.admins.join(' ').split(' ').include?(user)
    return 'op' if m.channel.ops.join(' ').split(' ').include?(user)
    return 'half-op' if m.channel.half_ops.join(' ').split(' ').include?(user)
    return 'voiced' if m.channel.voiced.join(' ').split(' ').include?(user)
    'no rank'
  end

  def clearlog(m)
    if getrank(m, m.user.name) != 'admin' && getrank(m, m.user.name) != 'owner' && getrank(m, m.user.name) != 'op'
      m.reply 'Only channel operators may reset the history!'
      return
    end
    channel = m.channel.to_s[1..m.channel.to_s.length]
    filename = "data/logs/#{channel}.yaml"
    File.delete(filename)
    File.new(filename, 'w+')
    exconfig = YAML.load_file('data/logs/logs.example.yaml')
    File.open(filename, 'w') { |f| f.write exconfig.to_yaml }
    m.reply 'Consider the channel log history c l e a r e d.'
  end

  def log_public_message(m)
    return if m.params[1][0..1] == 's/'
    channel = m.channel.to_s[1..m.channel.to_s.length]
    filename = "data/logs/#{channel}.yaml"
    unless File.exist?(filename)
      File.new(filename, 'w+')
      exconfig = YAML.load_file('data/logs/logs.example.yaml')
      File.open(filename, 'w') { |f| f.write exconfig.to_yaml }
    end
    data = YAML.load_file(filename)
    count = data['count']
    data[count + 1] = "#{m.user}: #{m.message}"
    data['count'] += 1
    File.open(filename, 'w') { |f| f.write data.to_yaml }
  end
end
