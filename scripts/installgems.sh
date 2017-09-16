while true
do
  echo "Installing those gems"
  gem install cinch
  gem install rest-client
  gem install nokogiri
  echo "Booting up the bot..."
  ruby bot.rb
done
