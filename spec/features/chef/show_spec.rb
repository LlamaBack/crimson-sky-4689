require 'rails_helper'

RSpec.describe 'chef show page' do
    let!(:chef1) {Chef.create!(name: "joe shmo")}
    let!(:dish1) {chef1.dishes.create!(name: "mac n cheese", description: "elbows n cheese", )}
    let!(:ingredient1) {dish1.ingredients.create!(name: "cheese", calories: 30)}
    let!(:ingredient2) {dish1.ingredients.create!(name: "elbow noodles", calories: 25)}

    it 'shows chef name and link to ingredients' do
        visit chef_path(chef1)
        expect(page).to have_content(chef1.name)
        expect(page).to have_link("Go to Ingredients")
    end

    it 'links to chef ingredients index page' do
        visit chef_path(chef1)
        click_link("Go to Ingredients")
        expect(current_path).to eq("/chefs/#{chef1.id}/ingredients")
    end

end