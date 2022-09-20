class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients_used
    Ingredient.joins(:dishes).where("dishes.chef_id = #{self.id}").distinct
  end
end