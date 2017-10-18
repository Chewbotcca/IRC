class Formatting
  include Cinch::Plugin

  match /rainbow (.+)/, method: :rainbow
  match /wrainbow (.+)/, method: :rainbow

  def rainbow(m, args)
    case m.params[1].split(' ')[0]
    when "!rainbow"
      args = args.split('')
    when "!wrainbow"
      args = args.split(' ')
    end
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
        message[current] = Format(:lime, args[current])
        current += 1
        message[current] = Format(:green, args[current])
        current += 1
        message[current] = Format(:teal, args[current])
        current += 1
        message[current] = Format(:aqua, args[current])
        current += 1
        message[current] = Format(:blue, args[current])
        current += 1
        message[current] = Format(:purple, args[current])
        current += 1
        message[current] = Format(:pink, args[current])
        current += 1
      rescue
        current = amount
      end
    end
    case m.params[1].split(' ')[0]
    when "!rainbow"
      m.reply message.join('')
    when "!wrainbow"
      m.reply message.join(' ')
    end
  end
end
