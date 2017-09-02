class Uptime
  include Cinch::Plugin

  match /uptime/, method: :uptime

  def uptime(m)
    t = Time.now - starttime
    mm, ss = t.divmod(60)
    hh, mm = mm.divmod(60)
    dd, hh = hh.divmod(24)
    m.reply 'Uptime: %d days, %d hours, %d minutes and %d seconds' % [dd, hh, mm, ss]
  end
end
