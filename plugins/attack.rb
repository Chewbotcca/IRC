class Attack
  include Cinch::Plugin

  match /slap (.+)/, method: :slap
  match /kill (.+)/, method: :kill

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

  def kill(m, user)
    user.delete!(' ')
    gun = [
      'machine gun', 'automatic pistol', 'Uzi', 'Glock-18', 'P250', 'Desert Eagle', 'Dual Berettas', 'Tec-9', 'CZ75 Auto', 'R8 Revolver', 'P2000', 'USP-S', 'P250', 'Five-SeveN', 'Nova', 'XM1014', 'Sawed-Off', 'MAG-7', 'MAC-10', 'MP7', 'UMP-45', 'PP-Bizon', 'P90', 'MP9', 'Galil AR', 'AK-47', 'SSG 08', 'SG 553', 'AWP', 'G3SG1', 'FAMAS', 'M4A4', 'M4A1-S', 'AUG', 'SCAR-20', 'M249', 'Negev', 'MP5'
    ].sample
    limbs = %w[legs arms limbs].sample
    beast = ['black dragon', 'owlbear', 'kraken', 'wither', 'ender dragon'].sample
    ball_game = %w[baseball football soccer tennis cricket].sample
    weapon_stab = ['knife', 'shard of glass', 'sword blade', 'butchers knife', 'corkscrew'].sample
    weapon_slice = ['sharpened katana', 'chainsaw', 'rusty scythe', 'polished axe'].sample
    weapon_crush = ['spiked mace', 'baseball bat', 'wooden club', 'massive steel ball', 'heavy iron rod'].sample
    tall_thing = ['bridge', 'tall building', 'cliff', 'mountain'].sample
    spiked_thing = ['boulder', 'rock', 'barrel of rocks'].sample
    templates = [
      "rips off #{user}'s #{limbs} and leaves them to die.",
      "grabs #{user}'s head and rips it clean off their body.",
      "grabs a #{gun} and riddles #{user}'s body with bullets.",
      "gags and ties #{user} then throws them off a #{tall_thing}.",
      "crushes #{user} with a huge spiked #{spiked_thing}.",
      "glares at #{user} until they die of boredom.",
      "stabs #{user} in the heart a few times with a #{weapon_stab}.",
      "gets some friends together and shivs #{user} a few times.",
      "smashes #{user}'s head in with a #{weapon_crush}.",
      "shoves #{user} into a microwave and waits until they pop.",
      "rips #{user}'s intestines and uses them as a skipping rope.",
      "unleashes the armies of Isengard on #{user}.",
      "gags and ties #{user} then throws them off a #{tall_thing} to their death.",
      "reaches out and punches right through #{user}'s chest.",
      "beheads #{user} with a #{weapon_slice} and uses their head to play #{ball_game}.",
      "slices #{user}'s limbs off with a #{weapon_slice}.",
      "throws #{user} to Cthulu and watches them get ripped to shreds.",
      "feeds #{user} to an angry #{beast}.",
      "turns #{user} into a snail and covers them in salt.",
      "snacks on #{user}'s dismembered body.",
      "puts #{user} into a sack, throws the sack in the river, and hurls the river into space.",
      "goes bowling with #{user}'s disembodied head."
    ].sample
    m.reply Format(:italic, templates)
  end
end
