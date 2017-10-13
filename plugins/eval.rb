class Eval
  include Cinch::Plugin

  match /eval (.+)/, method: :execute

  def execute(m, code)
    if m.user.host == CONFIG['ownerhost']
      begin
        m.reply (eval code)
      rescue => e
        m.reply "#{['Well, excuse me, mr nobrain, cant even eval correctly smh.', "You can't eval? Why are you running a bot!", 'Evaluation error! Please consult your handbook (as in how to properly ruby)', 'The real error here is your lack of ruby knowledge', 'Has halloween come early this year? because your lack of ability to eval is pretty spooky.'].sample} THE ERROR: ```#{e}```"
      end
    else
      m.reply 'An error was thrown (similar to a baseball). It crashed through your house window and had a message written on it. It says: "You do not have permission to evaluate!" Now you have to fix your window.'
    end
  end
end
