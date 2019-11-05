class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amount)
    ingredients_required[ingredient] = amount
  end

  def amount_required(ingredient)
    ingredients_required.find do |item, amount|
      return amount if item == ingredient
    end
  end

  def ingredients
    ingredients_required.map {|item, amount| item}
  end

  def calories
    ingredients_required.sum {|item, amount| item.calories * amount}
  end
end
