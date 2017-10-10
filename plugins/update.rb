class Update
  include Cinch::Plugin

  match /update/, method: :update

  def update(m)
    if m.user.host == CONFIG['ownerhost']
      if CONFIG['os'] == 'Windows'
        m.reply 'Restarting not supported on Windows!'
      end
      if CONFIG['os'] == 'Mac' || CONFIG['os'] == 'Linux'
        begin
          m.reply 'Restarting and Updating!'
          sleep 1
          exec('bash scripts/update.sh')
        end
      end
    else
      m.reply "You can't update! (If you are the owner of the bot, you did not configure properly! Otherwise, stop trying to restart the bot!)"
    end
  end
end
