# Thanks Cah!

while true
do
  echo "Grabbing latest code from GitHub!"
  git pull origin master

  echo "Booting up the bot..."
  ruby bot.rb
done
