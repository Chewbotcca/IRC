class Restart
  include Cinch::Plugin

  match /restart/, method: :restart
  match /update/, method: :update

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

  def restart(m)
    return if Time.now - STARTTIME < 10
    unless authenticate(m) && checkperm(m, m.user.name, 'restart')
      m.reply "You can't update! (If you are the owner of the bot, you did not configure properly! Otherwise, stop trying to update the bot!)"
      return
    end
    m.reply 'Restarting the bot without updating...'
    sleep 1
    if CONFIG['bundler'] == 'true' || CONFIG['bundler'] == true
      exec('bundle exec ruby bot.rb')
    else
      exec('ruby bot.rb')
    end
  end

  def update(m)
    return if Time.now - STARTTIME < 10
    unless authenticate(m) && checkperm(m, m.user.name, 'restart')
      m.reply "You can't update! (If you are the owner of the bot, you did not configure properly! Otherwise, stop trying to update the bot!)"
      return
    end
    m.reply 'Restarting and Updating!'
    sleep 1
    `git pull`
    if CONFIG['bundler'] == 'true' || CONFIG['bundler'] == true
      exec('bundle exec ruby bot.rb')
    else
      exec('ruby bot.rb')
    end
  end
end
