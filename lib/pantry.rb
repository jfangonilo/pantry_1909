class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def restock(item, amount)
    stock[item] += amount
  end

  def stock_check(item)
    stock.reduce(0) do |acc, (ingredient, amount)|
      acc += amount if ingredient == item
      acc
    end
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.all? do |item, amount|
      stock_check(item) > recipe.amount_required(item)
    end
  end
end
