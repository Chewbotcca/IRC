# Credits and API Usage

## API

### `!cat`

1) [random.cat](http://random.cat) - Used for one of the 2 cat link options

2) [TheCatAPI](http://thecatapi.com) - Used as the other cat link option.

### `!uuid`

The Minecraft APIs are from [GameAPIs](https://docs.gameapis.net/)

### `!trbmb`

This is my own personal API website, documentation [here](http://github.com/Chewsterchew/API).

### `!bitcoin`

I used [CoinDesk](https://api.coindesk.com) to find bitcoin prices.

## Ruby Gems

### Ruby itself

The language is in Ruby, feel free to google what you need for that.

Ruby comes built in with Gems I used

#### `yaml` Gem

I used this gem for the CONFIG file.

#### `open-uri` Gem

This gem is used by Nokogiri but I'm unsure why.

#### `JSON` Gem

I used this gem to parse JSON that rest-client got for me <3

#### `net/http` Gem

Probably used by Rest-Client and Nokogiri.

### `cinch` Gem

I used the [cinch gem](http://github.com/cinchrb/cinch) to actually run the bot. This is the base gem that makes the bot run and without it, the bot wouldn't exist :(

### `rest-client` Gem

I used the [rest-client gem](https://github.com/rest-client/rest-client) to get urls from a website. This is used both for `!trbmb`, `!ron`, and `!uuid`

### `Nokogiri` Gem

I used the [Nokogiri gem](https://github.com/sparklemotion/nokogiri) to parse XML for the `!cat` command.
