class Restart
  include Cinch::Plugin

  match /restart/, method: :restart
  match /update/, method: :update
  match /updates/, method: :updates
  match /version/, method: :updates

  def restart(m)
    return if Time.now - STARTTIME < 10
    unless authenticate(m) && checkperm(m, m.user.name, 'restart')
      m.reply "You can't update! (If you are the owner of the bot, you did not configure properly! Otherwise, stop trying to update the bot!)"
      return
    end
    m.reply 'Restarting the bot without updating...'
    sleep 1
    bot.quit
    `ruby bot.rb`
  end

  def update(m)
    return if m.params[1][CONFIG['prefix'].length..CONFIG['prefix'].length + 7] == 'updates'
    return if Time.now - STARTTIME < 10
    unless authenticate(m) && checkperm(m, m.user.name, 'restart')
      m.reply "You can't update! (If you are the owner of the bot, you did not configure properly! Otherwise, stop trying to update the bot!)"
      return
    end
    m.reply 'Restarting and Updating!'
    sleep 1
    `git pull`
    bot.quit
    `ruby bot.rb`
  end

  def updates(m)
    `git fetch` if authenticate(m) && checkperm(m, m.user.name, 'restart')
    response = `git rev-list origin/master | wc -l`.to_i
    commits = `git rev-list master | wc -l`.to_i
    m.reply "You are running Chewbotcca version #{commits}"
    sleep 1
    if authenticate(m) && checkperm(m, m.user.name, 'restart')
      m.reply 'Checking for updates...'
      sleep 1
      if response == commits
        m.reply 'You are running the latest version.'
      elsif response < commits
        m.reply "You are running an un-released version! Are you a developer? (Their Version: #{response})"
      else
        m.reply "You are #{response - commits} version(s) behind! Run `#{CONFIG['prefix']}update` to update"
      end
    end
  end
end
