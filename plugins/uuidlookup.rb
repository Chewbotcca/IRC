class UuidLookup
  include Cinch::Plugin

  match /uuid (.+)/, method: :lookforit
  def lookforit(m, name)
    m.reply "The UUID of #{name} is: #{JSON.parse(RestClient.get("https://api.mojang.com/users/profiles/minecraft/#{name}"))['id']}"
  end
end
