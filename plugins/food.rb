class Food
  include Cinch::Plugin

  match /taco (.+)/, method: :taco
  match /cookie (.+)/, method: :cookie

  def taco(m, user)
    toppings = ['guacamole', 'salsa', 'sour cream', 'cheese', 'lettuce', 'tomatoes', 'avocado', 'onion', 'scallions', 'jalepeños', 'capsicum', 'ghost chili', 'olives', 'pineapple', 'raspberries']
    tacotype = %w(spicy mild tasty delicious boring disgusting perfect)
    meat = ['minced beef', 'shredded beef', 'steak', 'pork', 'various meats', 'chicken', 'refried beans', 'tofu']
    m.reply "#{m.user.nick} gives #{user} a #{tacotype.sample} taco filled with #{meat.sample} with #{toppings.sample}, #{toppings.sample}, and #{toppings.sample}!"
  end

  def cookie(m, user)
    cookies = ['Chocolate Chip', 'Oatmeal', 'Sugar', 'Oatmeal Raisin', 'Macadamia Nut', 'Jam Thumbprint', 'Medican Wedding', 'Biscotti', 'Oatmeal Cranberry', 'Chocolate Fudge', 'Peanut Butter', 'Pumpkin', 'Lemon Bar', 'Chocolate Oatmeal Fudge', 'Toffee Peanut', 'Danish Sugar', 'Triple Chocolate', 'Oreo']
    size = ['small', 'little', 'medium-sized', 'large', 'gigantic']
    flavour = %w(tasty delectable delicious yummy toothsome scrumptious luscious)
    methods = %w(makes gives gets buys)
    side_dish = ['glass of milk', 'bowl of ice cream', 'bowl of chocolate sauce']
    m.reply "#{m.user.nick} #{methods.sample} #{user} a #{flavour.sample} #{size.sample} #{cookies.sample} cookie and serves it with a #{side_dish.sample}"
  end
end
