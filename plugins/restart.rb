class Restart
  include Cinch::Plugin

  match /restart (.+)/, method: :restart

  def restart(m, task)
    task.downcase!
    if m.user.host == CONFIG['ownerhost']
      if CONFIG['os'] == 'Windows'
        m.reply 'Restarting not supported on Windows!'
      end
      if CONFIG['os'] == 'Mac' || 'Linux'
        if task == 'update'
          begin
            m.reply 'Restarting and Updating!'
            sleep 1
            exec('bash scripts/update.sh')
          end
        end
        if task == 'pushlocal'
          begin
            m.reply 'Restarting and uploading all that fancy local code'
            sleep 1
            exec('bash scripts/push.sh')
          end
        end
        if task == 'restartonly'
          begin
            m.reply 'Restarting the bot without updating...'
            sleep 1
            exec('bash scripts/restartonly.sh')
          end
        end
        if task == 'pushonly'
          begin
            m.reply 'Restarting the bot using saved commits...'
            sleep 1
            exec('bash scripts/pushonly.sh')
          end
        end
      end
    else
      event.respond "You can't restart! (If you are the owner of the bot, you did not configure properly! Otherwise, stop trying to restart the bot!)"
    end
  end
end
