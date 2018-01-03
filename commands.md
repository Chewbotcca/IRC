# Command List

Plugin       | Command                                     | Aliases                                 | Description
------------ | ------------------------------------------- | --------------------------------------- | ----------------------------------------------------------------------------------------------
About        | `!about`                                    | None                                    | Shows information about the bot.
About        | `!ping`                                     | None                                    | Pings the bot to see if it's alive. u ok?
About        | `!uptime`                                   | None                                    | Check bot uptime.
About        | `!bug [description]`                        | `!suggestion` `!issue`                  | Report a bug to the github repo. Requires git, hub, and your github credentials cached in git.
Base64       | `!base64 [string]`                          | None                                    | Encode [string] with base64
Base64       | `!debase64 [string]`                        | None                                    | Decode [string] from base64
Base64       | `!isbase64 [string]`                        | None                                    | Checks to see if a string really is base64.
Bitcoin      | `!bitcoin`                                  | None                                    | Returns current bitcoin value.
Bitcoin      | `!zetacoin`                                 | None                                    | Returns current Zetacoin value.
Bitcoin      | `!litecoin`                                 | None                                    | Returns current Litecoin value.
Bitcoin      | `!darkcoin`                                 | `!dash`                                 | Returns current Darkcoin/dash value.
Channel      | `!rquote`                                   | None                                    | Finds a random quote in the logs.
Channel      | `!quote [user]`                             | None                                    | Find a quote from a specific [user].
Channel      | `!resethistory`                             | None                                    | Reset channel log. Requires op or above. (Any of +oaq)
Channel      | `!channel [option] [setting]`               | None                                    | Modify channel options.
Cleverbot    | `!cleverbot [string]`                       | `!cb`                                   | Asks cleverbot a question.
Emoji        | `!b [string]`                               | `!:b:` `!🅱️`                           | Replaces all occurrences of B in [string] with 🅱️.
Emoji        | `!clap [string]`                            | `!:clap:` `!👏`                         | Replaces all spaces with 👏.
Emoji        | `!br [string]`                              | `!breplace` `!:b:replace` `!🅱️replace` | Replaces the first letter of each word in [string] with 🅱️
English      | `!define [word]`                            | None                                    | Define a [word]. (Requires Wordnik API)
English      | `!wordrandom`                               | `!randomword`                           | Find a random word. Pretty random.
English      | `!antonym [word]`                           | None                                    | Find the antonym of a [word]. (Requires Wordnik API)
Dictionary   | `!synonym [word]`                           | None                                    | Find synonyms for a [word].
Food         | `!taco [user]`                              | None                                    | Gives [user] a taco
Food         | `!cookie [user]`                            | None                                    | Gives [user] a cookie
Food         | `!potato [user]`                            | None                                    | Gives [user] a potato
Food         | `!cake [user]`                              | None                                    | Gives [user] a cake
Food         | `!biscuit [user]`                           | None                                    | Gives [user] a biscuit
Food         | `!sandwich [user]`                          | None                                    | Gives [user] a sandwich
Food         | `!fortune`                                  | None                                    | Gets a fortune cookie
Formatting   | `!rainbow [string]`                         | None                                    | Makes [string] into a rainbow.
Formatting   | `!wrainbow [string]`                        | None                                    | Makes [string] a rainbow, but only every word.
Formatting   | `!usa [string]`                             | None                                    | Similar to !rainbow, but makes text patriotic.
GitHub       | `!ghissue [repo] [issue#]`                  | `!ghpull`                               | Finds [issue#] in GitHub [repo].
Google       | `!video [yt id]`                            | None                                    | Finds stats about video [id].
Google       | `!googl [url]`                              | None                                    | Shortens [url] with goo.gl
Google       | `!youtube [search]`                         | None                                    | Searches youtube for [search].
Google       | `!youtime [search]`                         | None                                    | Finds duration of a youtube [video].
Grammar      | `!reverse [string]`                         | None                                    | Reverses Text. Example: "Hello" => "elloH"
Grammar      | `!length [string]`                          | None                                    | Find the length of the string. Example: "Hello" => 5
Grammar      | `!capitalize [string]`                      | `!cap`                                  | Turns "this" => "This"
Grammar      | `!upcase [string]`                          | `!up` `!upper`                          | Turns "this" => "THIS"
Grammar      | `!downcase [string]`                        | `!down`                                 | Turns "This" => "this"
Grammar      | `!derpify [string]`                         | None                                    | Kinda derpify the phrase. Example: "I like tornados" => "I LICK TORNADOS OMG LOL"
Grammar      | `!titlecase [string]`                       | `!title`                                | Turns "hello there" => "Hello There"
Grammar      | `!swapcase [string]`                        | `!swap`                                 | Turns "Hello" => "hELLO"
Grammar      | `!tableflip [string]`                       | `!table`                                | Turns "What are you doing" => "( ﾉ⊙︵⊙）ﾉ ︵ ƃnᴉod noʎ ǝɹɐ ʇɐɥʍ"
Grammar      | `!munge [string]`                           | None                                    | Munges up text. Which means you know when you hold down a letter on a digital keyboard.
InviteToJoin | `!leave`                                    | None                                    | Make Chewbotcca go away. Requires half-op (op) or above.
Language     | `!piglatin [text]`                          | None                                    | Converts [text] into pig latin.
Language     | `!leet [text]`                              | None                                    | L33t more like y33t 😂 👌 😂 👌
MemeDB       | `!memedb [meme]`                            | None                                    | Find a Meme in the MemeDB
Minecraft    | `!uuid [user]`                              | None                                    | Shows UUID for a [user].
Minecraft    | `!server [ip]`                              | None                                    | Looks up a server [ip] for stats. Provide an IP please.
Minecraft    | `!namemc [user]`                            | None                                    | Searches namemc for a term.
Minecraft    | `!mcstatus`                                 | None                                    | Finds mojang and minecraft status.
Minecraft    | `!namemcf [user]`                           | None                                    | Finds [user]'s friends on namemc.
Misc         | `!8ball [message]`                          | None                                    | Shake the magic 8ball.
Misc         | `!flip`                                     | `!coin`                                 | Flips a SINGULAR coin.
Misc         | `!qrcode [string]`                          | `!qr`                                   | Generate a QR Code from [string]!
Misc         | `!choose [1,2]`                             | None                                    | Chooses between options, comma separated.
ModifyConfig | `!configureownerhost [modifypass] [hostto]` | None                                    | Sets specified hostname to [hostto]
ModifyConfig | `!configure [modifypass] [option]`          | None                                    | Currently just sets ownerhost to your host.
ModifyConfig | `!addowner [modifypass] [hosttoadd]`        | None                                    | Add owner [hosttoadd] as an owner.
Music        | `!spalbum [search]`                         | None                                    | Searches Spotify for [album].
Music        | `!spartist [search]`                        | None                                    | Searches Spotify for [artist].
Music        | `!spotifyapi`                               | None                                    | Force updates Spotify api key from client id and secret. BOT OWNER ONLY.
Music        | `!spotify [song]`                           | None                                    | Searches Spotify for [song].
Music        | `!lastfm [user]`                            | None                                    | Find stats for last.fm [user].
Music        | `!lastfmartist [user]`                      | `!ltar` `!lastfmart`                    | Find top artists for [user].
Music        | `!lastfmalbum [user]`                       | `!ltal`                                 | Find top albums for [user].
Music        | `!lastfmtracks [user]`                      | `!ltop` `!lttr`                         | Find top tracks for [user].
Music        | `!lastfmcompare [user1] [user2]`            | None                                    | Compare 2 last.fm users.
NickServ     | `!nsregister [pass] [email]`                | None                                    | Registers with NickServ. Owner only.
NickServ     | `!nsverify [code]`                          | None                                    | Verify registration. Owner only.
Owner        | `!join [channel]`                           | None                                    | Force the bot join a Channel. Bot Owner Only.
Owner        | `!part [channel]`                           | None                                    | Force the bot leave a Channel. Bot Owner Only.
Owner        | `!die`                                      | None                                    | Shut down the bot :( Bot Owner Only.
Owner        | `!eval`                                     | None                                    | Evaluates ruby Expressions. Bot Owner Only.
Owner        | `!api [service] [key]`                      | None                                    | Sets API [service] to [key]. Bot owner only!
Owner        | `!uperms`                                   | None                                    | Find what perms you have
Quotes       | `!ron`                                      | None                                    | Generates a Ron Swanson Quote
Quotes       | `!trbmb`                                    | None                                    | Generates a random [TRBMB](http://trbmb.chew.pw) phrase
RandomCat    | `!cat`                                      | None                                    | Shows a random cat.
RandomCat    | `!mcat [1-5]`                               | `!multicat` `!kittens`                  | Multiple kittens!
Replace      | `s/[find]/[replace]`                        | None                                    | Replaces first occurrence of [find] in the logs with [replace].
Restart      | `!restart`                                  | None                                    | Restarts the Bot. Bot Owner Only.
Restart      | `!update`                                   | None                                    | Updates the Bot. Bot Owner Only.
Stats        | `!topspeakers`                              | None                                    | Returns a list of top speakers in the channel.
Stats        | `!topwords`                                 | None                                    | Returns a list of top words in the channel.
Stats        | `!wordused [word]`                          | None                                    | See how many times [word] was used in the channel.
Stats        | `!messagecount`                             | None                                    | Find the total message count in the logs
Streams      | `!mixer [user]`                             | None                                    | Shows mixer stats for user.

## Commands with no Prefix

Plugin       | Description                | Usage
------------ | -------------------------- | ------------------------------------------------
Channel      | Log all message            | Say a message in chat.
GitHub       | Describe GH Issues/Pulls   | Put a GitHub issue or pull request link in chat.
Google       | Describe youtube links     | Say a youtube link in chat.
InviteToJoin | Joins a channel            | Invite the bot to the channel
Music        | Refresh Spotify token      | Nothing, wait an hour or run `!spotifyapi`
NickServ     | Authenticate with NickServ | Nothing, start the bot.
