class Eval
  include Cinch::Plugin

  match /eval (.+)/, method: :execute

  def execute(m, code)
    if m.user.host == CONFIG['ownerhost']
      begin
        m.reply (eval code)
      rescue => e
        m.reply "Well, excuse me, mr nobrain, cant even eval correctly smh. THE ERROR: ```#{e}```"
      end
    else
      m.reply 'get off of my icloud'
    end
  end
end
