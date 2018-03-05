# Command List

<link rel="stylesheet" href="searchBoxes.css">
<script src="searchTable.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<input type="text" id="findblocks" onkeyup="searchTable(0, 'findblocks')" placeholder="Search by Plugin">
<input type="text" id="findids" onkeyup="searchTable(1, 'findids')" placeholder="Command">
<input type="text" id="findprice" onkeyup="searchTable(2, 'findprice')" placeholder="Aliases">
<input type="text" id="findbuy" onkeyup="searchTable(3, 'findbuy')" placeholder="Description">

{:#blocks}
Plugin       | Command                                 | Aliases                                 | Description
------------ | --------------------------------------- | --------------------------------------- | ----------------------------------------------------------------------------------------------
About        | `!about`                                | None                                    | Shows information about the bot.
About        | `!ping`                                 | None                                    | Pings the bot to see if it's alive. u ok?
About        | `!uptime`                               | None                                    | Check bot uptime.
About        | `!bug [description]`                    | `!suggestion` `!issue`                  | Report a bug to the GitHub repo. Requires git, hub, and your github credentials cached in git.
Attack       | `!slap [user]`                          | None                                    | Slap a [user].
Attack       | `!kill [user]`                          | None                                    | Kill a [user].
Attack       | `!lart [user]`                          | None                                    | Lart a [user]
Attack       | `!flirt`                                | None                                    | Make the bot flirt.
Base64       | `!base64 [string]`                      | None                                    | Encode [string] with base64
Base64       | `!debase64 [string]`                    | None                                    | Decode [string] from base64
Base64       | `!isbase64 [string]`                    | None                                    | Checks to see if a string really is base64.
Bitcoin      | `!bitcoin`                              | None                                    | Returns current bitcoin value.
Bitcoin      | `!zetacoin`                             | None                                    | Returns current Zetacoin value.
Bitcoin      | `!litecoin`                             | None                                    | Returns current Litecoin value.
Bitcoin      | `!darkcoin`                             | `!dash`                                 | Returns current Darkcoin/Dash value.
Bitcoin      | `!dogecoin`                             | None                                    | Returns current DogeCoin value.
Channel      | `!rquote`                               | None                                    | Finds a random quote in the logs.
Channel      | `!quote [user]`                         | None                                    | Find a quote from a specific [user].
Channel      | `!resethistory`                         | None                                    | Reset channel log. Requires op or above. (Any of +oaq)
Channel      | `!channel [option] [setting]`           | None                                    | Modify channel options.
Channel      | `!seen [user]`                          | None                                    | See when a user last spoke in the logs.
Cleverbot    | `!cleverbot [string]`                   | `!cb`                                   | Asks Cleverbot a question.
Emoji        | `!b [string]`                           | `!:b:` `!🅱️`                           | Replaces all occurrences of B in [string] with 🅱️.
Emoji        | `!clap [string]`                        | `!:clap:` `!👏`                         | Replaces all spaces with 👏.
Emoji        | `!br [string]`                          | `!breplace` `!:b:replace` `!🅱️replace` | Replaces the first letter of each word in [string] with 🅱️
Emoji        | `!tm [string]`                          | `!™`                                    | Suffix each word with "™"
English      | `!define [word]`                        | None                                    | Define a [word]. (Requires Wordnik API)
English      | `!wordrandom`                           | `!randomword`                           | Find a random word. Pretty random.
English      | `!antonym [word]`                       | None                                    | Find the antonym of a [word]. (Requires Wordnik API)
English      | `!synonym [word]`                       | None                                    | Find synonyms for a [word].
English      | `!urban [word]`                         | None                                    | Searches urbandictionary for word.
Food         | `!taco [user]`                          | None                                    | Gives [user] a taco
Food         | `!cookie [user]`                        | None                                    | Gives [user] a cookie
Food         | `!potato [user]`                        | None                                    | Gives [user] a potato
Food         | `!cake [user]`                          | None                                    | Gives [user] a cake
Food         | `!biscuit [user]`                       | None                                    | Gives [user] a biscuit
Food         | `!sandwich [user]`                      | None                                    | Gives [user] a sandwich
Food         | `!fortune`                              | None                                    | Gets a fortune cookie
Formatting   | `!rainbow [string]`                     | None                                    | Makes [string] into a rainbow.
Formatting   | `!wrainbow [string]`                    | None                                    | Makes [string] a rainbow, but only every word.
Formatting   | `!usa [string]`                         | None                                    | Similar to !rainbow, but makes text patriotic.
Formatting   | `!colorbarf [string]`                   | `!multicolor`                           | Similar to !rainbow, but uses all 98 different colours.
GitHub       | `!ghissue [repo] [issue#]`              | `!ghpull`                               | Finds [issue#] in GitHub [repo].
Google       | `!video [yt id]`                        | None                                    | Finds stats about video [id].
Google       | `!googl [url]`                          | None                                    | Shortens [url] with goo.gl
Google       | `!youtube [search]`                     | `!yt`                                   | Searches youtube for [search].
Google       | `!youtime [search]`                     | None                                    | Finds duration of a youtube [video].
Google       | `!lmgtfy [string]`                      | None                                    | Uses lmgtfy to search google.
Google       | `!lmbtfy [string]`                      | None                                    | Uses lmbtfy to search bing.
Google       | `!lmddgtfy [string]`                    | None                                    | Uses lmddgtfy to search duckduckgo.
Grammar      | `!reverse [string]`                     | None                                    | Reverses Text. Example: "Hello" => "elloH"
Grammar      | `!length [string]`                      | None                                    | Find the length of the string. Example: "Hello" => 5
Grammar      | `!capitalize [string]`                  | `!cap`                                  | Turns "this" => "This"
Grammar      | `!upcase [string]`                      | `!up` `!upper`                          | Turns "this" => "THIS"
Grammar      | `!downcase [string]`                    | `!down`                                 | Turns "This" => "this"
Grammar      | `!derpify [string]`                     | None                                    | Kinda derpify the phrase. Example: "I like tornados" => "I LICK TORNADOS OMG LOL"
Grammar      | `!titlecase [string]`                   | `!title`                                | Turns "hello there" => "Hello There"
Grammar      | `!swapcase [string]`                    | `!swap`                                 | Turns "Hello" => "hELLO"
Grammar      | `!tableflip [string]`                   | `!table`                                | Turns "What are you doing" => "( ﾉ⊙︵⊙）ﾉ ︵ ƃnᴉod noʎ ǝɹɐ ʇɐɥʍ"
Grammar      | `!munge [string]`                       | None                                    | Munges up text. Which means you know when you hold down a letter on a digital keyboard.
InviteToJoin | `!leave`                                | None                                    | Make Chewbotcca go away. Requires half-op (op) or above.
Language     | `!piglatin [text]`                      | None                                    | Converts [text] into pig latin.
Language     | `!leet [text]`                          | None                                    | L33t more like y33t 😂 👌 😂 👌
MemeDB       | `!memedb [meme]`                        | None                                    | Find a Meme in the MemeDB
Minecraft    | `!uuid [user]`                          | None                                    | Shows UUID for a [user].
Minecraft    | `!server [ip]`                          | None                                    | Looks up a server [ip] for stats. Provide an IP please.
Minecraft    | `!namemc [user]`                        | None                                    | Searches NameMC for a term.
Minecraft    | `!mcstatus`                             | None                                    | Finds Mojang and Minecraft status.
Minecraft    | `!namemcf [user]`                       | None                                    | Finds [user]'s friends on NameMC.
Misc         | `!8ball [message]`                      | None                                    | Shake the magic 8ball.
Misc         | `!flip`                                 | `!coin`                                 | Flips a SINGULAR coin.
Misc         | `!qrcode [string]`                      | `!qr`                                   | Generate a QR Code from [string]!
Misc         | `!choose [1,2]`                         | None                                    | Chooses between options, comma separated.
Music        | `!spalbum [search]`                     | None                                    | Searches Spotify for [album].
Music        | `!spartist [search]`                    | None                                    | Searches Spotify for [artist].
Music        | `!spotifyapi`                           | None                                    | Force updates Spotify api key from client id and secret. Requires [changeconfig permission](http://irc.chewbotcca.co/permissions#changeconfig).
Music        | `!spotify [song]`                       | None                                    | Searches Spotify for [song].
Music        | `!lastfm [user]`                        | None                                    | Find stats for last.fm [user].
Music        | `!lastfmartist [user]`                  | `!ltar` `!lastfmart`                    | Find top artists for [user].
Music        | `!lastfmalbum [user]`                   | `!ltal`                                 | Find top albums for [user].
Music        | `!lastfmtracks [user]`                  | `!ltop` `!lttr`                         | Find top tracks for [user].
Music        | `!lastfmcompare [user1] [user2]`        | None                                    | Compare 2 last.fm users.
NickServ     | `!nsregister [pass] [email]`            | None                                    | Registers with NickServ. Owner only.
NickServ     | `!nsverify [code]`                      | None                                    | Verify registration. Owner only.
Owner        | `!join [channel]`                       | None                                    | Force the bot join a Channel. Requires [botchans permission](http://irc.chewbotcca.co/permissions#botchans).
Owner        | `!part [channel]`                       | None                                    | Force the bot leave a Channel. Requires [botchans permission](http://irc.chewbotcca.co/permissions#botchans).
Owner        | `!die`                                  | None                                    | Shut down the bot :( Requires [die permission](http://irc.chewbotcca.co/permissions#die).
Owner        | `!eval`                                 | None                                    | Evaluates ruby Expressions. Requires [eval permission](http://irc.chewbotcca.co/permissions#eval).
Owner        | `!api [service] [key]`                  | None                                    | Sets API [service] to [key]. Requires [changeconfig permission](http://irc.chewbotcca.co/permissions#changeconfig).
Owner        | `!uperms`                               | None                                    | Find what perms you have
Owner        | `!config [option] [setting]`            | None                                    | Change config options. Requires [changeconfig permission](http://irc.chewbotcca.co/permissions#changeconfig).
Owner        | `!permissions [staff] [perm] [setting]` | None                                    | Change [staff] member's [permission] to [setting]. Requires [changepermissions permission](http://irc.chewbotcca.co/permissions#changepermissions).
Quotes       | `!ron`                                  | None                                    | Generates a Ron Swanson Quote
Quotes       | `!trbmb`                                | None                                    | Generates a random [TRBMB](http://trbmb.chew.pw) phrase
Quotes       | `!acronym [phrase]`                     | None                                    | Uses [Acronym Gen](http://acronym.chew.pro) to fill out a phrase.
RandomCat    | `!cat`                                  | None                                    | Shows a random cat.
RandomCat    | `!mcat [1-5]`                           | `!multicat` `!kittens`                  | Multiple kittens!
Replace      | `s/[find]/[replace]`                    | `S/`                                    | Replaces first occurrence of [find] in the logs with [replace].
Restart      | `!restart`                              | None                                    | Restarts the Bot. Requires [restart permission](http://irc.chewbotcca.co/permissions#restart).
Restart      | `!update`                               | None                                    | Updates the Bot. Requires [restart permission](http://irc.chewbotcca.co/permissions#restart).
Restart      | `!updates`                              | `!version`                              | Checks for updates (must be using Git)
Stats        | `!topspeakers`                          | None                                    | Returns a list of top speakers in the channel.
Stats        | `!topwords`                             | None                                    | Returns a list of top words in the channel.
Stats        | `!wordused [word]`                      | None                                    | See how many times [word] was used in the channel.
Stats        | `!messagecount`                         | None                                    | Find the total message count in the logs
Stats        | `!messages [user]`                      | None                                    | See how many messages user has sent!
Streams      | `!mixer [user]`                         | None                                    | Shows mixer stats for user.

## Commands with no Prefix

Plugin       | Description                | Usage
------------ | -------------------------- | ------------------------------------------------
Channel      | Log all message            | Say a message in chat.
GitHub       | Describe GH Issues/Pulls   | Put a GitHub issue or pull request link in chat.
Google       | Describe youtube links     | Say a youtube link in chat.
InviteToJoin | Joins a channel            | Invite the bot to the channel
Music        | Refresh Spotify token      | Nothing, wait an hour or run `!spotifyapi`
NickServ     | Authenticate with NickServ | Nothing, start the bot.
