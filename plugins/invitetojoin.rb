class InviteToJoin
  include Cinch::Plugin

  listen_to :invite, method: :invite
  match /leave/, method: :leave

  def invite(m)
    channels = CONFIG['channels'].split(',')
    channels += [m.channel] unless channels.include?(m.channel)
    CONFIG['channels'] = channels.join(',')
    File.open('config.yaml', 'w') { |f| f.write CONFIG.to_yaml }
    Channel(m.channel.to_s).join
  end

  def authenticate(m)
    name = m.user.name
    stafffile = "data/staff/#{name}.yaml"
    return unless File.exist?(stafffile)
    staffdata = YAML.load_file(stafffile)
    authtype = staffdata['authtype']
    if authtype == 'host'
      return true if staffdata['host'] == m.user.host
    end
    if authtype == 'username'
      return true if staffdata['user'] == m.user.user
    end
    if authtype == 'nickname'
      return true if staffdata['nick'] == m.user.nick
    end
    if authtype == 'userhost'
      if staffdata['user'] == m.user.user && staffdata['host'] == m.user.host
        return true
      end
    end
    if authtype == 'all'
      if staffdata['user'] == m.user.user && staffdata['host'] == m.user.host && staffdata['nick'] == m.user.nick
        return true
      end
    end
    false
  end

  def checkperm(_m, user, perm)
    stafffile = "data/staff/#{user}.yaml"
    return unless File.exist?(stafffile)
    staffdata = YAML.load_file(stafffile)
    return true if staffdata[perm] == true
    false
  end

  def leave(m)
    if authenticate(m) && checkperm(m, m.user.name, 'fullchannelperms') || m.channel.half_ops.join(' ').split(' ').include?(m.user.nick) || m.channel.ops.join(' ').split(' ').include?(m.user.nick) || m.channel.admins.join(' ').split(' ').include?(m.user.nick) || m.channel.owners.join(' ').split(' ').include?(m.user.nick)
      channels = CONFIG['channels'].split(',')
      channels -= [m.channel.name]
      CONFIG['channels'] = channels.join(',')
      File.open('config.yaml', 'w') { |f| f.write CONFIG.to_yaml }
      m.reply 'Bye!'
      Channel(m.channel).part
    else
      m.reply 'Only half-ops and above may force me to leave!'
    end
  end
end
