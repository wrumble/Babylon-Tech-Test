    require 'spec_helper'

    describe Promotion_Check do

      let(:check) { Promotion_Check.new basket, rules_list }
      let(:item_1) { {code: "001", name: "Lavender Heart", price: 9.25} }
      let(:basket) { [item_1, item_1] }
      let(:item_rule) { {rule_type: "item", item_code: 1, number_of_items: 2, new_item_price: 8.50} }
      let(:total_rule)  { {rule_type: "total", total_price_break: 60.00, discount_percentage: 10} }
      let(:rules_list) { [ 1 => item_rule, 2 => total_rule ] }

      describe "#initialize" do
        it "starts with a list of the rules" do
          expect(check.rules_list).to eq( [ 1 => item_rule, 2 => total_rule ] )
        end
      end

      describe "#applicable_item_rules" do
        it "finds the rules that apply to the baskets items" do
          item_code = 1
          count = 2
          check.applicable_item_rules(item_code, count)
          expect(check.item_rules).to eq [item_rule]
        end
      end

      describe "#apply_item_rules" do
        it "updates basket items prices" do
          new_item_1 = {code: "001", name: "Lavender Heart", price: 8.50}
          new_basket = [new_item_1, new_item_1]
          item_code = 1
          count = 2
          check.applicable_item_rules(item_code, count)
          expect(check.basket).to eq new_basket
        end
      end
    end
