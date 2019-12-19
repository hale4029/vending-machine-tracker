require 'rails_helper'

RSpec.describe MachineItem, type: :model do
  describe "relationships" do
    it {should belong_to :machine}
    it {should belong_to :item}
  end
end
