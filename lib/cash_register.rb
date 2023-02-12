class CashRegister
  def initialize(discount = 0, total = 0, titles = [], cart_check = 0)
    @total = total
    @discount = discount
    @titles = titles
  end

  attr_accessor :discount, :total
  attr_accessor :titles
  attr_accessor :last_price
  attr_accessor :cart_check

  def add_item(title, price, quantity = 1)
    self.total = self.total + (quantity * price)
    self.last_price = price
    check = Array(1..quantity)
    pp check
    check.each { self.titles << title }
    if self.cart_check == nil
      self.cart_check = 1
    else
      self.cart_check = self.cart_check + 1
    end
  end

  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      puts self.discount / 100.to_f
      self.total = self.total - (self.total * self.discount / 100).to_f
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def items
    self.titles
  end

  def void_last_transaction
    if self.cart_check == 1
      self.total = 0.0
    else
      self.total = self.total - self.last_price
      self.cart_check = self.cart_check - 1
    end
  end
end
