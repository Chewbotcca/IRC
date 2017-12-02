class Setup
  def initialize
    begin
      require 'yaml'
    rescue LoadError
      puts 'YAML not found! Is your ruby ok?'
      exit
    end
    unless File.exist?('config.yaml')
      puts 'No config file! Creating one now..'
      File.new('config.yaml', 'w+')
      exconfig = YAML.load_file('config.example.yaml')
      File.open('config.yaml', 'w') { |f| f.write exconfig.to_yaml }
    end
    @config = YAML.load_file('config.yaml')
    exit if @config == false
  end

  def welcome(skipwelcome = false)
    unless skipwelcome
      puts 'Welcome to Chewbotcca IRC bot setup'
      puts 'This really simple GUI will guide you in setting up the bot by yourself!'
      puts 'Press enter to get started'
      gets
    end
    puts 'What would you like to Configure (type number then press enter)'
    puts '[1] - Configure the bot'
    puts '[2] - Set up owner perms'
    puts '[3] - Exit!'
    input = gets.chomp

    config if input == '1'
    owner if input == '2'
    exit
  end

  def config
    puts 'Alright! Config time.'

    puts 'What would you like to configure?'
    puts '[1] - Bot information (REQUIRED)'
    puts '[2] - Owner information'
    puts '[3] - API Keys'
    puts '[4] - Main Menu'
    input = gets.chomp

    configure('bot') if input == '1'
    configure('owner') if input == '2'
    configure('api') if input == '3'
    welcome
  end

  def configure(section)
    if section == 'bot'
      puts 'Pick a nickname for the bot - REQUIRED'
      @config['nickname'] = gets.chomp

      puts 'Enter the server address (hostname, IP, whatever, NO PORT yet) - REQUIRED '
      @config['server'] = gets.chomp

      puts 'Enter the server port, if you don\'t know, use 6667 - REQUIRED '
      @config['port'] = gets.chomp

      puts 'Connect using SSL? (true/false)'
      @config['ssl'] = gets.chomp

      puts 'What channels should the bot join on startup? this must be comma seperated with #s before the names. - Optional'
      puts 'Hint! You can always invite the bot to your channel and it will join!'
      @config['channels'] = gets.chomp

      puts "What should be the bot's realname? This is shown on a whois. - Optional"
      @config['realname'] = gets.chomp

      puts 'What should be the bot\'s USERNAME (this is what\'s shown before the @ in a hostname. e.g. chew!THIS@blah) - Optional'
      @config['username'] = gets.chomp

      puts 'NickServ Password - Optional'
      puts 'Not registered? THe bot has a built in nickserv registration process!'
      @config['nickservpass'] = gets.chomp

      puts 'Bot Prefix - Optional'
      puts 'What should be the bot\'s prefix? Leave empty for the default, "!"'
      @config['prefix'] = gets.chomp

      puts 'It turns out you\'re done configuring bot settings!'
      save
      config
    end

    if section == 'owner'
      puts 'Owner hostmask - Optional'
      puts "If you don't know, this can be added later."
      @config['ownerhost'] = gets.chomp

      puts 'ModifyConfig Pass - Optional (recommended)'
      puts "If you want to use commands (such as to set your ownerhost, or become a bot owner), you'll need to fill this out, and keep it secret!"
      @config['modifypass'] = gets.chomp

      puts 'It turns out you\'re done configuring owner settings!'
      save
      config
    end

    if section == 'api'
      puts 'Wordnik API key. Very optional and only needed for !define !antonym and !synonym'
      @config['wordnik'] = gets.chomp

      puts 'Google API key. Very optional and only needed for !youtube and such'
      @config['google'] = gets.chomp

      puts 'Cleverbot API key.'
      @config['cleverbot'] = gets.chomp

      puts 'Spotify Client ID (application).'
      @config['spotifyclientid'] = gets.chomp

      puts 'Spotify Client Secret (application).'
      @config['spotifysecret'] = gets.chomp

      puts 'Last.fm API key.'
      @config['lastfm'] = gets.chomp

      puts 'It turns out you\'re done configuring APO settings!'
      save
      config
    end
  end

  def save
    File.open('config.yaml', 'w') { |f| f.write @config.to_yaml }
  rescue => e
    puts 'uh oh, there was an error saving. Report the following error to Chew on github'
    puts e
  end

  def owner
    puts 'Your IRC Nickname. Please use your CURRENT nickname, you will need it for the next step'
    @config['ownernick'] = gets.chomp

    puts 'Do you plan to use bundler (ruby gem)? If you don\'t know what this is, assume no and say "false", Otherwise say "true"'
    @config['bundler'] = gets.chomp

    save

    if @config['bundler'] == 'true'
      puts 'Now, we will use bundler to install the gems! Please standby'
      `bundle install`
      puts 'All installed! Let\'s continue'
    end
    puts 'Now, we are going to make sure you have all of your gems. Press enter to install neccessary gems.'
    require './requiregems.rb'
    puts 'Now, a confirmation bot will join with the config you created and verify your identify. Hop on your irc client!'
    if @config['bundler'] == 'true'
      `ruby scripts/confirm.rb`
    else
      `bundle exec ruby scripts/confirm.rb`
    end
  end
end

jerry = Setup.new
jerry.welcome
