while true
do
  echo "Lets upload those local commits"
  git add .
  git commit -m "Upload from local repository"
  git push

  echo "Booting up the bot..."
  ruby bot.rb
done
