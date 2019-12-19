require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it { should validate_presence_of :price }
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :machine_items}
    it { should have_many(:machines).through(:machine_items)}
  end
end
