require 'rails_helper'

RSpec.describe Chef, type: :model do
  let!(:chef1) {Chef.create!(name: "joe shmo")}
  let!(:dish1) {chef1.dishes.create!(name: "mac n cheese", description: "elbows n cheese", )}
  let!(:ingredient1) {dish1.ingredients.create!(name: "cheese", calories: 30)}
  let!(:ingredient2) {dish1.ingredients.create!(name: "elbow noodles", calories: 25)}

  let!(:dish2) {chef1.dishes.create!(name: "salad", description: "green stuff", )}
  let!(:ingredient3) {dish2.ingredients.create!(name: "spring mix", calories: 2)}
  let!(:ingredient4) {dish2.ingredients.create!(name: "ranch", calories: 12)}

  let!(:ingredient5) {Ingredient.create!(name: "mystery", calories: 0)}

  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end
  describe "instance methods" do
    describe "#ingredients_used" do
      it "gives a unique list of ingredients the chef used" do
        expect(chef1.ingredients_used).to eq([ingredient1,ingredient2,ingredient3,ingredient4])
      end
    end
  end
end