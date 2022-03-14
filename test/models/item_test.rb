require "test_helper"

class ItemTest < ActiveSupport::TestCase
  describe "with valid params" do
    let(:item) { Item.new(description: "Description") }

    it "creates an item" do
      expect item.valid?
    end
  end
end
