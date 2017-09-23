# Chewbotcca IRC Bot

I made this bot for my IRC Network. It's ok i guess.

## How to install and run

## Downloading

1) Download using `git clone https://github.com/Chewsterchew/ChewbotccaIRC`
2) Install ruby. don't ask me how just google it
3) Modify the config to your liking.

### Install via `gem install`

1) If on Mac or Linux, run `./scripts/installgems.sh` then `ruby bot.rb` otherwise:

```bash
gem install cinch nokogiri rest-client
ruby bot.rb
```

### Install using bundler

1) Download bundler gem with `gem install bundler`

2) `bundle install`

3) `bundle exec ruby bot.rb`


IF YOU'RE CONFUSED (which i already am), just send an issue.

Orr... join Chewbotcca IRC Channel! [Click here to join! (with KiwiIRC)](http://chew.pro/ChewbotccaIRC/irc)

## Commands

Category | Command | Usage
-----|------|-------
Useful | `!ping` | Pings the bot to see if it's alive. u ok?
Useful | `!uptime` | Check bot uptime.
Fun | `!cat` | Shows a random cat. aww
Fun | `!memedb` | Find a Meme in the MemeDB
Fun | `!trbmb` | Generates a random [TRBMB](http://trbmb.chew.pw) phrase
Minecraft | `!uuid` | Shows UUID for a user.
Minecraft | `!server` | Looks up a server for stats. Provide an IP please.
Owner | `!configure` | Configure certain aspects of the bot.
Owner | `!setownerhost` | Set the Owner Host.
Owner | `!join` | Force the bot join a Channel
Owner | `!part` | Force the bot leave a Channel
Owner | `!restart [args]` | Restarts the Bot. Args: [restartonly, update]
