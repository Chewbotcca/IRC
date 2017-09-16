class InviteToJoin
  include Cinch::Plugin

  listen_to :invite, method: :invite

  def invite(m)
    CONFIG['channels'] = (CONFIG['channels']).to_s.sub("#{m.channel}", '')
    CONFIG['channels'] = (CONFIG['channels']).to_s.sub(',,', ',')
    CONFIG['channels'] = "#{CONFIG['channels']},#{m.channel}"
    CONFIG['channels'] = (CONFIG['channels']).to_s.sub(',,', ',')
    File.open('config.yaml', 'w') { |f| f.write CONFIG.to_yaml }
    Channel(m.channel.to_s).join
  end
end
