class Attack
  include Cinch::Plugin

  match /slap (.+)/, method: :slap
  match /kill (.+)/, method: :kill
  match /lart (.+)/, method: :lart

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
    m.reply "#{m.user.name} #{templates}"
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
    m.reply "#{m.user.name} #{templates}"
  end

  def lart(m, user)
    user.delete!(' ')
    templates = [
      "smacks #{user} in the face with a burlap sack full of broken glass.",
      "swaps #{user}'s shampoo with glue.",
      "installs Windows Vista on #{user}'s computer.",
      "forces #{user} to use perl for 3 weeks.",
      "registers #{user}'s name with 50 known spammers.",
      "resizes #{user}'s console to 40x24.",
      "takes #{user}'s drink.",
      "dispenses #{user}'s email address to a few hundred 'bulk mailing services'.",
      "pokes #{user} in the eye.",
      "beats #{user} senseless with a 50lb Linux manual.",
      "cats /dev/random into #{user}'s ear.",
      "signs #{user} up for AOL.",
      "downvotes #{user} on Reddit.",
      "enrolls #{user} in Visual Basic 101.",
      "sporks #{user}.",
      "drops a truckload of support tickets on #{user}.",
      "judo chops #{user}.",
      "sets #{user}'s resolution to 800x600.",
      "formats #{user}'s harddrive to fat12.",
      "rm -rf's #{user}.",
      "makes #{user} learn C++.",
      "steals #{user}'s mojo.",
      "strangles #{user} with a doohicky mouse cord.",
      "whacks #{user} with the cluebat.",
      "sells #{user} on EBay.",
      "drops creepers on #{user}'s house.",
      "throws all of #{user}'s diamond gear into lava.",
      "uses #{user} as a biological warfare study.",
      "uses the 'Customer Appreciation Bat' on #{user}.",
      "puts #{user} in the Total Perspective Vortex.",
      "saves all of #{user}'s files on a Magical Chinese Looping Hard Drive.",
      "casts #{user} into the fires of Mt. Doom.",
      "gives #{user} a melvin.",
      "turns #{user} over to the Fun Police.",
      "turns over #{user} to Agent Smith to be 'bugged'.",
      "takes away #{user}'s internet connection.",
      "pushes #{user} past the Shoe Event Horizon.",
      "counts '1, 2, 5... er... 3!' and hurls the Holy Handgrenade Of Antioch at #{user}.",
      "puts #{user} in a nest of camel spiders.",
      "puts 'alias vim=emacs' in #{user}'s /etc/profile.",
      "uninstalls every web browser from #{user}'s system.",
      "signs #{user} up for getting hit on the head lessons.",
      "makes #{user} try to set up a Lexmark printer.",
      "fills #{user}'s eyedrop bottle with lime juice.",
      "casts #{user} into the fires of Mt. Doom.",
      "gives #{user} a Flying Dutchman.",
      "pierces #{user}'s nose with a rusty paper hole puncher.",
      "pokes #{user} with a rusty nail.",
      "puts sugar between #{user}'s bedsheets.",
      "pours sand into #{user}'s breakfast.",
      "mixes epoxy into #{user}'s toothpaste.",
      "forces #{user} to use a Commodore 64 for all their word processing.",
      "puts #{user} in a room with several heavily armed manic depressives.",
      "makes #{user} watch reruns of \"Blue's Clues\".",
      "puts lye in #{user}'s coffee.",
      "lets Borg have his way with #{user}.",
      "signs #{user} up for line dancing classes at the local senior center.",
      "gives #{user} a 2 gauge Prince Albert.",
      "forces #{user} to eat all their veggies.",
      "covers #{user}'s toilet paper with lemon-pepper.",
      "fills #{user}'s ketchup bottle with Dave's Insanity sauce.",
      "forces #{user} to stare at an incredibly frustrating and seemingly never-ending IRC political debate.",
      "knocks two of #{user}'s teeth out with a 2x4.",
      "removes Debian from #{user}'s system.",
      "switches #{user} over to CentOS.",
      "uses #{user}'s iPod for skeet shooting practice.",
      "gives #{user}'s phone number to Borg.",
      "posts #{user}'s IP, username(s), and password(s) on 4chan.",
      "tickles #{user} until they wet their pants and pass out.",
      "replaces #{user}'s KY with elmer's clear wood glue.",
      "replaces #{user}'s TUMS with alka-seltzer tablets.",
      "squeezes habanero pepper juice into #{user}'s tub of vaseline.",
      "forces #{user} to learn the Win32 API.",
      "gives #{user} an atomic wedgie.",
      "ties #{user} to a chair and forces them to listen to Nickelback at full blast.",
      "forces #{user} to use notepad for text editing.",
      "frowns at #{user} really, really hard.",
      "jabs a hot lighter into #{user}'s eye sockets.",
      "forces #{user} to browse the web with IE6.",
      "takes #{user} out at the knees with a broken pool cue.",
      "forces #{user} to listen to emo music.",
      "lets a few creepers into #{user}'s house.",
      "signs #{user} up for the Iowa State Ferret Legging Championship.",
      "attempts to hotswap #{user}'s RAM.",
      "dragon punches #{user}.",
      "puts railroad spikes into #{user}'s side.",
      "replaces #{user}'s lubricant with liquid weld.",
      "replaces #{user}'s stress pills with rat poison pellets.",
      "replaces #{user}'s itch cream with hair removal cream.",
      "does the Australian Death Grip on #{user}.",
      "dances upon the grave of #{user}'s ancestors.",
      "farts loudly in #{user}'s general direction.",
      "flogs #{user} with stinging nettle.",
      "hands #{user} a poison ivy joint."
    ].sample
    m.reply "#{m.user.name} #{templates}"
  end

  def flirt(m)
    flirts = File.readlines('data/messages/flirts.txt') { |line| line.split.map(&:to_s).join }
    m.reply flirts.sample
  end
end
