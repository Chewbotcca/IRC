class InviteToJoin
  include Cinch::Plugin

  listen_to :invite, method: :invite

  def invite(m)
    if CONFIG['channels'] != ''
      CONFIG['channels'] = "#{CONFIG['channels']},#r28trgh9247tg24h9"
      CONFIG['channels'] = (CONFIG['channels']).to_s.sub("#{m.channel},", '')
      CONFIG['channels'] = (CONFIG['channels']).to_s.sub(',,', ',')
      CONFIG['channels'] = (CONFIG['channels']).to_s.sub('#r28trgh9247tg24h9', '')
      CONFIG['channels'] = (CONFIG['channels']).to_s.chomp(',')
      CONFIG['channels'] = "#{CONFIG['channels']},#{m.channel}"
      CONFIG['channels'] = (CONFIG['channels']).to_s.sub(',,', ',')
    else
      CONFIG['channels'] = m.channel.to_s
    end
    File.open('config.yaml', 'w') { |f| f.write CONFIG.to_yaml }
    Channel(m.channel.to_s).join
  end
end
