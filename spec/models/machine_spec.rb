require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
  end

  describe 'relationships' do
    it { should belong_to :owner }
    it { should have_many :machine_items}
    it { should have_many(:items).through(:machine_items)}
  end

  it "average_item_price" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    dons.items.create(name: "food", price: 1.50)
    dons.items.create(name: "snack", price: 2.00)
    result = dons.average_item_price
    expect(result).to eq(1.75)
  end
end
