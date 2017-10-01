class QRCode
  include Cinch::Plugin

  match /qr (.+)/, method: :execute
  match /qrcode (.+)/, method: :execute

  def execute(m, string)
    m.reply URI.escape("https://api.qrserver.com/v1/create-qr-code/?data=#{string}&size=150x150&.png")
  end
end
