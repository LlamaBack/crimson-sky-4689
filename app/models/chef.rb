class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients_used
    Ingredient.joins(:dishes).where("dishes.chef_id = #{self.id}").distinct
  end

  def top_three_ingredients
    ingredients = Ingredient.joins(:dishes).where("dishes.chef_id = #{self.id}")
    ingredient_count = Hash.new(0)
    ingredients.each do |ingredient|
      ingredient_count[ingredient] += 1
    end
    ingredient_count.sort_by {|ingredient, count| count}.reverse[0..2]
  end
end