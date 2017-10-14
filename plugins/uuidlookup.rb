class UuidLookup
  include Cinch::Plugin

  match /uuid (.+)/, method: :lookforit
  def lookforit(m, name)
    if !JSON.parse(RestClient.get("https://use.gameapis.net/mc/player/profile/#{name}"))['error'].nil?
      m.reply "Error: #{JSON.parse(RestClient.get("https://use.gameapis.net/mc/player/profile/#{name}"))['error']} Make sure it is spelled correctly. (It is not case-sensitive)"
    else
      m.reply "The UUID of #{JSON.parse(RestClient.get("https://use.gameapis.net/mc/player/profile/#{name}"))['name']} is: #{JSON.parse(RestClient.get("https://use.gameapis.net/mc/player/profile/#{name}"))['uuid_formatted']}"
    end
  end
end
