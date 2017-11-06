class Flip
  include Cinch::Plugin

  match /flip/, method: :flip
  match /coin/, method: :flip

  def flip(m)
    first = ['I flipped a coin, and it landed on ', 'I threw the coin into the air and it finally landed on ', 'I dropped the coin, it landed on '].sample
    headtails = %w[Heads Tails].sample
    m.reply "#{first} #{headtails}"
  end
end
