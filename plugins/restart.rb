class Restart
  include Cinch::Plugin

  match /restart/, method: :restart

  def restart(m)
    if m.user.host == CONFIG['ownerhost']
      if CONFIG['os'] == 'Windows'
        m.reply 'Restarting not supported on Windows!'
      end
      if CONFIG['os'] == 'Mac' || CONFIG['os'] == 'Linux'
        begin
          m.reply 'Restarting the bot without updating...'
          sleep 1
          exec('bash scripts/restartonly.sh')
        end
      end
    else
      m.reply "You can't restart! (If you are the owner of the bot, you did not configure properly! Otherwise, stop trying to restart the bot!)"
    end
  end
end
