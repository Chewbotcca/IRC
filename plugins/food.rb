class Taco
  include Cinch::Plugin

  match /taco (.+)/, method: :destination

  def destination(m, user)
    toppings = ['guacamole','salsa','sour cream','cheese','lettuce','tomatoes','avocado','onion','scallions','jalepeños','capsicum','ghost chili','olives','pineapple','raspberries']
    m.reply "#{m.user.nick} gives #{user} a #{['spicy','mild','tasty','delicious','boring','disgusting','perfect'].sample} taco filled with #{['minced beef','shredded beef','steak','pork','various meats','chicken','refried beans','tofu'].sample} with #{toppings.sample}, #{toppings.sample}, and #{toppings.sample}!"
  end
end
