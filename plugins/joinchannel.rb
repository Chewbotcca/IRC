class JoinChannel
  include Cinch::Plugin

  match /join (.+)/, method: :join

  def join(m, join)
    if m.user.host == CONFIG['ownerhost']
      d = YAML.load_file('config.yaml')
      d['channels'] = "#{d['channels']},#{join}"
      File.open('config.yaml', 'w') { |f| f.write d.to_yaml }
      Channel(join).join
      m.reply 'Joined the channel successfully!'
    else
      m.reply 'You are not permitted to do this action!'
    end
  end
end
