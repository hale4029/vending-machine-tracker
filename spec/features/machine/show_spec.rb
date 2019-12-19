require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  it 'they see items and their price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    item_1 = dons.items.create(name: food, price: 1.50)
    item_2 = dons.items.create(name: snack, price: 2.00)

    expect(page).to have_content(@item_1.name)
    expect(page).to have_content(@item_1.price)
    expect(page).to have_content(@item_2.name)
    expect(page).to have_content(@item_1.price)
  end
end
