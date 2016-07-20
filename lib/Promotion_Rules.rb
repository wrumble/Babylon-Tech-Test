class Promotion_Rules

  attr_accessor :list

  def initialize
    @list = {}
  end

  def add new_rule
    count = list.count + 1
    list[count] = new_rule
  end

  def delete rule_code
    list.delete_if { |key| key == rule_code }
  end

  def update rule_code, updated_rule
    list.select{ |key| list[key] = updated_rule if key == rule_code }
  end

  def find rule_code
    list.select{ |key| return list[key] if key == rule_code}
  end

end
