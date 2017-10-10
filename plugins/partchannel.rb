class PartChannel
  include Cinch::Plugin

  match /part (.+)/, method: :part

  def part(m, part)
    if m.user.host == CONFIG['ownerhost']
      CONFIG['channels'] = "#{CONFIG['channels']},#r28trgh9247tg24h9"
      CONFIG['channels'] = (CONFIG['channels']).to_s.sub("#{part},", '')
      CONFIG['channels'] = (CONFIG['channels']).to_s.sub(',,', ',')
      CONFIG['channels'] = (CONFIG['channels']).to_s.sub('#r28trgh9247tg24h9', '')
      CONFIG['channels'] = (CONFIG['channels']).to_s.chomp(',')
      File.open('config.yaml', 'w') { |f| f.write CONFIG.to_yaml }
      Channel(part).part
      m.reply 'Left the channel successfully!'
    else
      m.reply 'You are not permitted to do this action!'
    end
  end
end
