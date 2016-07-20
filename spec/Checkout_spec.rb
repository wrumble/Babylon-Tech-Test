require 'spec_helper'

describe Checkout do

  let(:oc) { Checkout.new }

  describe "#initialize" do
    it "starts with a total of 0.00" do
      expect(oc.total).to eq "£0.00"
    end

    it "starts with a sub_total of 0.00" do
      expect(oc.sub_total).to eq "£0.00"
    end

    it "starts basket starts as an empty array" do
      expect(oc.basket).to be_empty
    end
  end

  context "Scanning items wthout promotional rules" do

    describe "#total" do
      it "returns the items total in pounds" do
        item_2 = double(item_code: 002, name: 'Personalised Cuff Links', price: 45.00)
        oc.scan item_2
        expect(oc.total).to eq "£45.00"
      end
      it "returns multiple items total in pounds" do
        item_1 = double(item_code: 001, name: 'Lavender Heart', price: 9.25)
        item_2 = double(item_code: 002, name: 'Personalised Cuff Links', price: 45.00)
        oc.scan item_1
        oc.scan item_2
        expect(oc.total).to eq "£54.25"
      end
    end

    describe "#sub_total" do
      it "returns the items sub_total in pounds" do
        item_1 = double(item_code: 001, name: 'Lavender Heart', price: 9.25)
        oc.scan item_1
        expect(oc.sub_total).to eq "£9.25"
      end

      it "returns multiple items sub_total in pounds" do
        item_1 = double(item_code: 001, name: 'Lavender Heart', price: 9.25)
        item_2 = double(item_code: 002, name: 'Personalised Cuff Links', price: 45.00)
        oc.scan item_1
        oc.scan item_2
        expect(oc.sub_total).to eq "£54.25"
      end
    end


    context "Scanning items with promotional rules" do


    end
  end
end
