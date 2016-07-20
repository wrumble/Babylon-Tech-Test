require 'spec_helper'

describe Item do

  let(:item) { Item.new("001", "Lavender Heart", 9.25) }

  describe "#initialize" do
    it "returns the item code" do
      expect(item.code).to eq "001"
    end

    it "returns the item name" do
      expect(item.name).to eq "Lavender Heart"
    end

    it "returns the item price" do
      expect(item.price).to eq 9.25
    end
  end
end
