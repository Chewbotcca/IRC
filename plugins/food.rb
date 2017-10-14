class Food
  include Cinch::Plugin

  match /taco (.+)/, method: :taco

  def taco(m, user)
    toppings = ['guacamole', 'salsa', 'sour cream', 'cheese', 'lettuce', 'tomatoes', 'avocado', 'onion', 'scallions', 'jalepeños', 'capsicum', 'ghost chili', 'olives', 'pineapple', 'raspberries']
    tacotype = %w(spicy mild tasty delicious boring disgusting perfect)
    meat = ['minced beef', 'shredded beef', 'steak', 'pork', 'various meats', 'chicken', 'refried beans', 'tofu']
    m.reply "#{m.user.nick} gives #{user} a #{tacotype.sample} taco filled with #{meat.sample} with #{toppings.sample}, #{toppings.sample}, and #{toppings.sample}!"
  end
end
