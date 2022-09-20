require 'rails_helper'

RSpec.describe 'chef ingredients index page' do
    let!(:chef1) {Chef.create!(name: "joe shmo")}
    let!(:dish1) {chef1.dishes.create!(name: "mac n cheese", description: "elbows n cheese", )}
    let!(:ingredient1) {dish1.ingredients.create!(name: "cheese", calories: 30)}
    let!(:ingredient2) {dish1.ingredients.create!(name: "elbow noodles", calories: 25)}

    let!(:dish2) {chef1.dishes.create!(name: "salad", description: "green stuff", )}
    let!(:ingredient3) {dish2.ingredients.create!(name: "spring mix", calories: 2)}
    let!(:ingredient4) {dish2.ingredients.create!(name: "ranch", calories: 12)}

    let!(:ingredient5) {Ingredient.create!(name: "mystery", calories: 0)}


    it 'shows unique chef ingredients' do
        dish2.ingredients << ingredient1
        visit "/chefs/#{chef1.id}/ingredients"
        save_and_open_page
        expect(page).to have_content(ingredient1.name).once
        expect(page).to have_content(ingredient2.name)
        expect(page).to have_content(ingredient3.name)
        expect(page).to have_content(ingredient4.name)
        expect(page).to_not have_content(ingredient5.name)
    end

end