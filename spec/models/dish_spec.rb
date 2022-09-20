require 'rails_helper'

RSpec.describe Dish, type: :model do
  let!(:chef1) {Chef.create!(name: "joe shmo")}
  let!(:dish1) {chef1.dishes.create!(name: "mac n cheese", description: "elbows n cheese", )}
  let!(:ingredient1) {dish1.ingredients.create!(name: "cheese", calories: 30)}
  let!(:ingredient2) {dish1.ingredients.create!(name: "elbow noodles", calories: 25)}

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance methods" do
    describe "#total_calories" do
      it 'sums all the ingredient calories of a dish' do
        expect(dish1.total_calories).to eq(55)
      end
    end
  end
end