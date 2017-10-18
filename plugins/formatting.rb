class Formatting
  include Cinch::Plugin

  match /rainbow (.+)/, method: :rainbow

  def rainbow(m, args)
    args = args.split('')
    amount = args.length
    current = 0
    message = Array.new(amount, '')
    while current < amount
      begin
        message[current] = Format(:red, args[current])
        current += 1
        message[current] = Format(:orange, args[current])
        current += 1
        message[current] = Format(:yellow, args[current])
        current += 1
        message[current] = Format(:green, args[current])
        current += 1
        message[current] = Format(:blue, args[current])
        current += 1
        message[current] = Format(:purple, args[current])
        current += 1
      rescue
        current = amount
      end
    end
    m.reply message.join('')
  end
end
