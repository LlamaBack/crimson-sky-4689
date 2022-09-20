require 'rails_helper'

RSpec.describe 'chef show page' do
    let!(:chef1) {Chef.create!(name: "joe shmo")}
    let!(:dish1) {chef1.dishes.create!(name: "mac n cheese", description: "elbows n cheese", )}
    let!(:ingredient1) {dish1.ingredients.create!(name: "cheese", calories: 30)}
    let!(:ingredient2) {dish1.ingredients.create!(name: "elbow noodles", calories: 25)}
  
    let!(:dish2) {chef1.dishes.create!(name: "salad", description: "green stuff", )}
    let!(:ingredient3) {dish2.ingredients.create!(name: "spring mix", calories: 2)}
    let!(:ingredient4) {dish2.ingredients.create!(name: "ranch", calories: 12)}
  
    let!(:dish3) {chef1.dishes.create!(name: "huh?", description: "what stuff", )}
    let!(:ingredient5) {dish3.ingredients.create!(name: "mystery", calories: 0)}
    it 'shows chef name and link to ingredients' do
        visit chef_path(chef1)
        expect(page).to have_content(chef1.name)
        expect(page).to have_link("Ingredients Used")
    end

    it 'links to chef ingredients index page' do
        visit chef_path(chef1)
        click_link("Ingredients Used")
        expect(current_path).to eq("/chefs/#{chef1.id}/ingredients")
    end

    it 'shows chefs top 3 ingredients' do
        dish1.ingredients << ingredient4
        dish2.ingredients << [ingredient1, ingredient5]
        dish3.ingredients << [ingredient1, ingredient5, ingredient5]
        visit chef_path(chef1)
        # save_and_open_page
        expect(ingredient5.name).to appear_before(ingredient1.name)
        expect(ingredient1.name).to appear_before(ingredient4.name)
    end

end