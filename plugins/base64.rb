class BaseS4
  include Cinch::Plugin

  match /base64 (.+)/, method: :base64
  match /debase64 (.+)/, method: :debase

  def base64(m, args)
    m.reply Base64.encode64(args)
  end

  def debase(m, args)
    decoded = Base64.decode64(args)
    if decoded == ''
      m.reply 'Boi whatchu doin? that aint base64! get outta here wit yo basealphabet nonsense.'
    else
      m.reply decoded
    end
  end
end
