# How to install and run Chewbotcca

## Downloading

### What you're gonna need:

1) Git (optional, but recommended)

2) Ruby (required)

### It's go time

1) If you have git, run `git clone https://github.com/Chewbotcca/IRC.git`. Otherwise, download the latest .ZIP from [here](https://github.com/Chewbotcca/IRC/archive/master.zip), or .tar.gz from [here](https://github.com/Chewbotcca/IRC/archive/master.tar.gz), then unzip it.

2) Install ruby. don't ask me how, just google it

3) Wow, you're done.

## Installing

It's go time.

### Install extremely lazily

If you simply run `ruby setup.rb`, a GUI will help you setup the bot!

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

Or... join Chewbotcca IRC Channel! [Click here to join! (with KiwiIRC)](irc)
