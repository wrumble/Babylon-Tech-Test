class Promotion_Check

  attr_accessor :rules_list, :basket, :item_rules

  def initialize basket, rules_list = []
    @rules_list = rules_list
    @basket = basket
  end

  def applicable_item_rules item_code, count
    @item_rules = []
    rules_list[0].map.each { |key| @item_rules << key[1] if key[1][:item_code] == item_code && key[1][:number_of_items] == count }
    apply_item_rules @item_rules, basket
  end

  def apply_item_rules item_rules, basket
    sorted_basket = basket.group_by { |x| x }.map { |k, v| {v.count => k} }
    item_rules.each do |rule|
      sorted_basket.each do |item|
        if item.first[0] == rule[:number_of_items]
          basket.select{|new_item| new_item[:price] = rule[:new_item_price] }
        end
      end
    end
  end

end
