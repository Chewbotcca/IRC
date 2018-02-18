class Attack
  include Cinch::Plugin

  match /slap (.+)/, method: :slap

  def slap(m, user)
    user.delete!(' ')
    item = [
      'cast iron skillet', 'large trout', 'baseball bat', 'cricket bat', 'wooden cane', 'nail', 'printer', 'shovel', 'pair of trousers', 'diamond sword', 'baguette', 'physics textbook', 'toaster', 'portrait of Ron Swanson', 'television', 'mau5head', 'five ton truck', 'roll of duct tape', 'book', 'laptop', 'old television', 'sack of rocks', 'rainbow trout', 'cobblestone block', 'lava bucket', 'rubber chicken', 'spiked bat', 'gold block', 'fire extinguisher', 'heavy rock', 'chunk of dirt'
    ].sample
    throws = %w[throws flings chucks].sample
    hits = %w[hits whacks slaps smacks].sample
    where = ['in the chest', 'on the head', 'on the bum'].sample
    templates = [
      "#{hits} #{user} with a #{item}.",
      "#{hits} #{user} around a bit with a #{item}.",
      "#{throws} a #{item} at #{user}.",
      "#{throws} a few #{item}s at #{user}.",
      "grabs a #{item} and #{throws} it in #{user}'s face.",
      "launches a #{item} in #{user}'s general direction.",
      "sits on #{user}'s face while slamming a #{item} into their crotch.",
      "starts slapping #{user} silly with a #{item}.",
      "holds #{user} down and repeatedly #{hits} them with a #{item}.",
      "prods #{user} with a #{item}.",
      "picks up a #{item} and #{hits} #{user} with it.",
      "ties #{user} to a chair and #{throws} a #{item} at them.",
      "#{hits} #{user} #{where} with a #{item}.",
      "ties #{user} to a pole and whips them with a #{item}."
    ].sample
    m.reply Format(:italic, templates)
  end
end
