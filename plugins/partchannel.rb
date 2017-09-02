class PartChannel
  include Cinch::Plugin

  match /part (.+)/, method: :part

  def part(m, part)
    if m.user.host == CONFIG['ownerhost']
      d = YAML.load_file('config.yaml')
      d['channels'] = "#{d['channels']},#r28trgh9247tg24h9"
      d['channels'] = (d['channels']).to_s.sub("#{part},", '')
      d['channels'] = (d['channels']).to_s.sub(',,', ',')
      d['channels'] = (d['channels']).to_s.sub('#r28trgh9247tg24h9', '')
      d['channels'] = (d['channels']).to_s.chomp(',')
      File.open('config.yaml', 'w') { |f| f.write d.to_yaml }
      Channel(part).part
      m.reply 'Left the channel successfully!'
    else
      m.reply 'You are not permitted to do this action!'
    end
  end
end
