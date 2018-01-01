class Owner
  include Cinch::Plugin

  match /join (.+)/, method: :join
  match /part (.+)/, method: :part
  match /eval (.+)/, method: :execute
  match /die/, method: :die
  match /api (.+) (.+)/, method: :api

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

  def api(m, service, key)
    return unless authenticate(m) && checkperm(m, m.user.name, 'eval')
    CONFIG[service] = key
    File.open('config.yaml', 'w') { |f| f.write CONFIG.to_yaml }
    m.reply "#{service} API key set to: `#{key}`!"
  end

  def die(m)
    if authenticate(m) && checkperm(m, m.user.name, 'die')

      m.reply 'Shutting down the bot peacefully...'
      sleep 1
      eval exit
    else
      m.reply "You can't kill the bot! (If you are the owner of the bot, you did not configure properly! Otherwise, stop trying to KILL the bot!)"
    end
  end

  def execute(m, code)
    if authenticate(m) && checkperm(m, m.user.name, 'eval')
      begin
        m.reply eval code
      rescue => e
        evalerrors = [
          'Well, excuse me, mr nobrain, cant even eval correctly smh.',
          "You can't eval? Why are you running a bot!",
          'Evaluation error! Please consult your handbook (as in how to properly ruby)',
          'The real error here is your lack of ruby knowledge.',
          'Has halloween come early this year? because your lack of ability to eval is pretty spooky.'
        ]
        m.reply "#{evalerrors.sample} THE ERROR: ```#{e}```"
      end
    else
      m.reply 'An error was thrown (similar to a baseball). It crashed through your house window and had a message written on it. It says: "You do not have permission to evaluate!" Now you have to fix your window.'
    end
  end

  def part(m, part)
    if authenticate(m) && checkperm(m, m.user.name, 'botchans')
      channels = CONFIG['channels'].split(',')
      channels -= [part]
      CONFIG['channels'] = channels.join(',')
      File.open('config.yaml', 'w') { |f| f.write CONFIG.to_yaml }
      Channel(part).part
      m.reply 'Left the channel successfully!'
    else
      m.reply 'You are not permitted to do this action!'
    end
  end

  def join(m, join)
    if authenticate(m) && checkperm(m, m.user.name, 'botchans')
      channels = CONFIG['channels'].split(',')
      channels += [join]
      CONFIG['channels'] = channels.join(',')
      File.open('config.yaml', 'w') { |f| f.write CONFIG.to_yaml }
      Channel(join).join
      m.reply 'Joined the channel successfully!'
    else
      m.reply 'You are not permitted to do this action!'
    end
  end
end
