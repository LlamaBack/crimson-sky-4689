require 'rails_helper'

RSpec.describe 'dish show page' do
    let!(:chef1) {Chef.create!(name: "joe shmo")}
    let!(:dish1) {chef1.dishes.create!(name: "mac n cheese", description: "elbows n cheese", )}
    xit 'shows dish attributes' do
        visit dish_path(dish1.id)
        expect(page).to have_content(dish1.name)
        expect(page).to have_content(dish1.description)
        expect(page).to have_content(chef1.name)
    end
end