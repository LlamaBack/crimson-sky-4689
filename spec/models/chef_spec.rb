require 'rails_helper'

RSpec.describe Chef, type: :model do
  let!(:chef1) {Chef.create!(name: "joe shmo")}
  let!(:dish1) {chef1.dishes.create!(name: "mac n cheese", description: "elbows n cheese", )}
  let!(:ingredient1) {dish1.ingredients.create!(name: "cheese", calories: 30)}
  let!(:ingredient2) {dish1.ingredients.create!(name: "elbow noodles", calories: 25)}

  let!(:dish2) {chef1.dishes.create!(name: "salad", description: "green stuff", )}
  let!(:ingredient3) {dish2.ingredients.create!(name: "spring mix", calories: 2)}
  let!(:ingredient4) {dish2.ingredients.create!(name: "ranch", calories: 12)}

  let!(:dish3) {chef1.dishes.create!(name: "huh?", description: "what stuff", )}
  let!(:ingredient5) {dish3.ingredients.create!(name: "mystery", calories: 0)}

  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end
  describe "instance methods" do
    describe "#ingredients_used" do
      it "gives a unique list of ingredients the chef used" do
        expect(chef1.ingredients_used).to eq([ingredient1,ingredient2,ingredient3,ingredient4,ingredient5])
      end
    end
    describe "#top_three_ingredients" do
      it 'returns most 3 ingredients used' do
        dish1.ingredients << ingredient4
        dish2.ingredients << [ingredient1, ingredient5]
        dish3.ingredients << [ingredient1, ingredient5, ingredient5]
        expect(chef1.top_three_ingredients).to eq([[ingredient5,4],[ingredient1,3],[ingredient4,2]])
      end
    end
  end
end