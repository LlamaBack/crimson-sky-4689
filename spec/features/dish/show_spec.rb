require 'rails_helper'

RSpec.describe 'dish show page' do
    let!(:chef1) {Chef.create!(name: "joe shmo")}
    let!(:dish1) {chef1.dishes.create!(name: "mac n cheese", description: "elbows n cheese", )}
    let!(:ingredient1) {dish1.ingredients.create!(name: "cheese", calories: 30)}
    let!(:ingredient2) {dish1.ingredients.create!(name: "elbow noodles", calories: 25)}

    it 'shows dish attributes' do
        visit dish_path(dish1.id)
        expect(page).to have_content(dish1.name)
        expect(page).to have_content(dish1.description)
        expect(page).to have_content(chef1.name)
        expect(page).to have_content(ingredient1.name)
        expect(page).to have_content(ingredient2.name)
    end

    it 'calculates total calories' do
        visit dish_path(dish1.id)
        expect(page).to have_content("Total Calories: 55")
    end
end