class BaseS4
  include Cinch::Plugin

  match /base64 (.+)/, method: :base64

  def base64(m, args)
    m.reply Base64.encode64(args)
  end
end
