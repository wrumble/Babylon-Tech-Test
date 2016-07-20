require 'spec_helper'

describe Promotion_Rules do
  let(:rules) { Promotion_Rules.new }
  let(:item_rule) { {rule_type: "item", item_code: 1, number_of_items: 2, new_item_price: 8.50} }
  let(:total_rule) { {rule_type: "total", total_price_break: 60.00, discount_percentage: 10} }
  let(:updated_rule) { {rule_type: "item", item_code: 1, number_of_items: 4, new_item_price: 7.50} }

  describe "#initialize" do
    it "with an empty rule list" do
      expect(rules.list).to eq( {} )
    end
  end

  describe "#add" do
    it "adds a new rule" do
      expect{rules.add(item_rule)}.to change{rules.list.length}.by(1)
    end
    it "adds a rule code to the new rule when added" do
      rules.add total_rule
      expect(rules.list).to eq( {1 => total_rule} )
    end
  end

  describe "#delete" do
    it "removes a rule when given the rule_code" do
      rule_code = 1
      rules.add total_rule
      expect{rules.delete(rule_code)}.to change{rules.list.length}.by(-1)
    end
  end

  describe "#update" do
    it "updates a rule when given the rulecode and rule updates" do
      rule_code = 1
      rules.add item_rule
      expect{rules.update(rule_code, updated_rule)}.to change{rules.list[rule_code]}.from(item_rule).to(updated_rule)
    end
  end

  describe "#find" do
    it "finds item rule with item code" do
      rules.add item_rule
      rule_code = 1
      expect(rules.find(rule_code)).to eq item_rule
    end
  end
end
