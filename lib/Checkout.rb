class Checkout

  attr_accessor :basket

  def initialize promotional_rules = []
    @promotional_rules = promotional_rules
    @basket = []
    @total = 0.00
    @sub_total = 0.00
  end

  def total
    basket.each {|item| @total += item.price }
    "£#{'%.02f' % @total}"
  end

  def sub_total
    basket.each {|item| @sub_total += item.price }
    "£#{'%.02f' % @sub_total}"
  end

  def scan item
    basket << item
  end
end
