# How to install and run Chewbotcca

## Downloading

### What you're gonna need:

1) Git (optional, but recommended)

2) Ruby (required)

### It's go time

1) If you have git, run `git clone https://github.com/Chewbotcca/IRC.git`. Otherwise, download the latest .ZIP from [here](https://github.com/Chewbotcca/IRC/archive/master.zip), or .tar.gz from [here](https://github.com/Chewbotcca/IRC/archive/master.tar.gz), then unzip it.

2) Install ruby. don't ask me how, just [DuckDuckGo](http://lmgtfy.com/?s=d&q=how%20to%20install%20ruby) it

3) Wow, you're done.

## Installing

It's go time.

### Installing Gems

You're gonna need the following gems:

- `cinch`

- `nokogiri`

- `rest-client`

We have many ways to get these gems.

- Run `ruby requiregems.rb`, then answer "y" to any prompts.

- Run `./scripts/installgems.sh` (Linux/Mac/Git Bash for Windows only).

- Run `gem install cinch nokogiri rest-client`

If you prefer bundler, feel free to run `bundle install`.

### Setting up the config.

Simply run `ruby setup.rb` to be guided through all the Chewbotcca setup! If you hate the G U I z o n e, you can always modify the config.example.yaml directly.

## Help.

IF YOU'RE CONFUSED (which i already am), just send an issue.

Or... join Chewbotcca IRC Channel! [Click here to join! (with KiwiIRC)](irc)
