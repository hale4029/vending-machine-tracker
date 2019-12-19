# As a visitor
# When I visit a snack show page
# I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.

require 'rails_helper'

RSpec.describe 'When I visit a snack show page', type: :feature do
  it 'I see the name of that snack' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    harry  = owner.machines.create(location: "Harrys's Mixed Drinks")
    item_1 = dons.items.create(name: "food", price: 1.50)
    item_2 = dons.items.create(name: "snack", price: 2.00)
    item_1 = harry.items.create(name: "food", price: 1.50)

    visit "items/#{item_1.id}"
    expect(page).to have_content(item_1.name)
    expect(page).to have_content("Price: 1.50")
    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content("Average Price: 1.75")
    expect(page).to have_content("Item Count: 2")
    expect(page).to have_content("Harrys's Mixed Drinks")
    expect(page).to have_content("Item Count: 1")
  end
end
