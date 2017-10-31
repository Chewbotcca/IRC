class Choose
  include Cinch::Plugin

  match /choose (.+)/, method: :choose

  def choose(m, args)
    args = args.split(',')
    m.reply args.sample
  end
end
